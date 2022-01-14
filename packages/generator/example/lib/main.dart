import 'package:fields_annotation/fields_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main.f.dart';

@fields
class Example {
  const Example({
    required String name,
    required this.code,
    required this.description,
    required this.date,
    required this.price,
  }) : _name = name;

  final String _name;
  final int code;

  @Field('desc')
  final String description;
  final DateTime date;

  @JsonKey(name: 'money')
  final double price;

  static const fields = _$ExampleFields();
}
