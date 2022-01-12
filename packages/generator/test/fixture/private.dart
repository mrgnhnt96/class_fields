import 'package:field_keys_annotation/field_keys.dart';

part './fixtures/private.dart';

@fieldKeys
class Person {
  const Person({
    required String name,
    required int age,
  })  : _name = name,
        _age = age;

  final String _name;
  final int _age;

  static const keys = _$PersonFieldKeys();
}
