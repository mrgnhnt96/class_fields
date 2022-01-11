import 'package:field_keys_annotation/field_keys.dart';

part './fixtures/basic.dart';

@fieldKeys
class Example {
  const Example({
    required this.name,
    required this.age,
  });

  final String name;
  @FieldKey('_age')
  final int age;

  static const keys = _$ExampleFieldKeys();
}
