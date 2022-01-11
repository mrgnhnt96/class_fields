import 'package:field_keys_annotation/field_keys.dart';

@fieldKeys
class MyClass {
  const MyClass({
    required this.name,
    required this.age,
  });

  final String name;
  final int age;
}
