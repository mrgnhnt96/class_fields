// ignore: avoid_relative_lib_imports
import '../lib/fields.dart';

@fields
class MyClass {
  const MyClass({
    required this.name,
    required this.age,
  });

  final String name;
  final int age;
}
