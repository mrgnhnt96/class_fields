import 'package:field_keys_annotation/field_keys.dart';

part './fixtures/with_getter.dart';

@fieldKeys
class Person {
  const Person({
    required this.name,
    required this.age,
  });

  final String name;
  final int age;

  String get lowercaseName => name.toLowerCase();

  static const keys = _$PersonFieldKeys();
}
