import 'package:equatable/equatable.dart';

dynamic defaultItemsGetter(Map<String, dynamic> json) => json['data'];

class Paging<T> extends Equatable {
  const Paging({
    required this.totalResult,
    required this.data,
  });

  final int totalResult;
  final List<T> data;

  @override
  List<Object?> get props => [totalResult, data];

  factory Paging.fromJson({
    required Map<String, dynamic> json,
    required Function(Map<String, dynamic> json) fromJson,
    // this getter will help to parse paging list inside an object data
    dynamic Function(Map<String, dynamic> json) itemsGetter =
        defaultItemsGetter,
  }) {
    final items = itemsGetter.call(json) as List<dynamic>;
    final results = List<T>.from(items.map((item) => fromJson(item)));
    return Paging(
      totalResult: json['totalCount'] as int,
      data: results,
    );
  }
}
