import 'package:class_fields_annotation/class_fields_annotation.dart';

part './fixtures/private.dart';

@fields
class Person {
  const Person({
    required String name,
    required int age,
  })  : _name = name,
        _age = age;

  final String _name;
  final int _age;

  static const fields = _$PersonFields();
}
