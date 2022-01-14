import 'package:fields_annotation/fields_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part './fixtures/with_key_annotation.dart';

@fields
class Person {
  const Person({
    required this.name,
    required this.age,
  });

  @JsonKey(name: 'something_cooler')
  final String name;

  @Field('edad')
  final int age;

  static const fields = _$PersonFields();
}
