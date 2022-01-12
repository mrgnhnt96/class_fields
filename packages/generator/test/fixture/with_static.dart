import 'package:field_keys_annotation/field_keys.dart';

part './fixtures/with_static.dart';

@fieldKeys
class Person {
  const Person({
    required this.name,
    required this.age,
  });

  final String name;
  final int age;

  static String get option => 'Other';

  static const keys = _$PersonFieldKeys();
}
