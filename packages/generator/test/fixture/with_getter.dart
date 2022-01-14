import 'package:class_fields_annotation/class_fields_annotation.dart';

part './fixtures/with_getter.dart';

@fields
class Person {
  const Person({
    required this.name,
    required this.age,
  });

  final String name;
  final int age;

  String get lowercaseName => name.toLowerCase();

  static const fields = _$PersonFields();
}
