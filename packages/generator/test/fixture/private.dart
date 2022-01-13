import 'package:fields_annotation/fields.dart';

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
