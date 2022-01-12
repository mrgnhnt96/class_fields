import 'package:field_keys_annotation/field_keys.dart';

part 'main.keys.dart';

@fieldKeys
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
  final String description;
  final DateTime date;
  final double price;

  static const keys = _$ExampleFieldKeys();
}
