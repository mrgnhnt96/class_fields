import 'package:class_fields_annotation/class_fields_annotation.dart';

@fields
class MyClass {
  const MyClass({
    required this.name,
    required this.age,
  });

  final String name;
  final int age;
}
