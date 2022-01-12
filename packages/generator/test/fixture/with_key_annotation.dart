import 'package:field_keys_annotation/field_keys.dart';
import 'package:json_annotation/json_annotation.dart';

part './fixtures/with_key_annotation.dart';

@fieldKeys
class Person {
  const Person({
    required this.name,
    required this.age,
  });

  @JsonKey(name: 'something_cooler')
  final String name;

  @FieldKey('edad')
  final int age;

  static const keys = _$PersonFieldKeys();
}
