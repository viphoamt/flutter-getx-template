import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.birthday,
  });

  final String id;
  final String name;
  final String email;
  final DateTime birthday;

  @override
  List<Object?> get props => [id, name, email, birthday];
}
