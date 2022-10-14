import 'package:flutter/foundation.dart';
import 'package:flutter_getx_base/commons/constant/index.dart';
import 'package:graphql/client.dart';

import '../error.dart';
import 'graphql_client_type.dart';

class GraphqlClient extends GraphqlClientType {
  GraphqlClient({
    required String endPoint,
    required String authToken,
  }) {
    _endPoint = endPoint;
    _authToken = authToken;
  }

  late String _endPoint;
  late String _authToken;

  GraphQLClient _instance() {
    final HttpLink httpLink = HttpLink(_endPoint);

    //Auth link
    final AuthLink authLink = AuthLink(getToken: () => 'Barber $_authToken');

    /// Link
    final Link link = authLink.concat(httpLink);

    ///Policies
    // - Remove cache
    final policies = Policies(fetch: FetchPolicy.networkOnly);

    /// We're using HiveStore for persistence,
    /// so we need to initialize Hive.
    // final store = await HiveStore.open(path: 'my/cache/path');
    return GraphQLClient(
      link: link,
      cache: GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        watchQuery: policies,
        query: policies,
        mutate: policies,
      ),
    );
  }

  @override
  Future handleException({required QueryResult<Object?> queryResult}) async {
    if (queryResult.exception?.linkException is HttpLinkServerException) {
      final HttpLinkServerException httpLink = queryResult
          .exception
          ?.linkException as HttpLinkServerException;
      if (httpLink
          .parsedResponse
          ?.errors?.isNotEmpty == true
      ) {
        final String message = '''"${
            httpLink.parsedResponse
                ?.errors
                ?.first.message}
        ''';
        if (kDebugMode) {
          print('GraphQL Error: $message');
        }
        throw Failure(message);
      }
    }
    if (queryResult.exception
        ?.linkException is NetworkException
    ) {
      final NetworkException networkException = queryResult
          .exception
          ?.linkException as NetworkException;
      final String message = '''"${
          networkException.message}
        ''';
      if (kDebugMode) {
        print('GraphQL Error: $message');
      }
      throw Failure(message);
    }
  }

  @override
  Future<QueryResult<Object?>> mutation({required String queries}) async {
    final MutationOptions options = MutationOptions(document: gql(queries));
    final response = await _instance().mutate(options);
    return response;
  }

  @override
  Future<QueryResult<Object?>> query({required String queries}) async {
    final WatchQueryOptions options = WatchQueryOptions(
      document: gql(queries),
      pollInterval: const Duration(seconds: AppConstant.connectApiTime),
      fetchResults: true,
    );
    final response = await _instance().query(options);
    return response;
  }
}
