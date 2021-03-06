import 'package:class_fields_annotation/class_fields_annotation.dart';

part './fixtures/basic.dart';

@fields
class Person {
  const Person({
    required this.name,
    required this.age,
  });

  final String name;
  final int age;

  static const fields = _$PersonFields();
}
