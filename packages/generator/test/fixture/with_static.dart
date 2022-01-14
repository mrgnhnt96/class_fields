import 'package:fields_annotation/fields_annotation.dart';

part './fixtures/with_static.dart';

@fields
class Person {
  const Person({
    required this.name,
    required this.age,
  });

  final String name;
  final int age;

  static String get option => 'Other';

  static const fields = _$PersonFields();
}
