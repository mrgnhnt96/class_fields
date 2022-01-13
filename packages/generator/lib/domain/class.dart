import 'package:analyzer/dart/element/element.dart';
import 'package:fields/domain/field.dart';

/// {@template class}
/// The subject of the `Fields` annotation
/// {@endtemplate}
class Class {
  /// {@macro class}
  const Class({
    required this.name,
    required this.fields,
  });

  /// gets the class from the [ClassElement]
  factory Class.fromElement(ClassElement element) {
    final name = element.name;
    final fields = Field.fromElements(element.fields);

    return Class(
      name: name,
      fields: fields,
    );
  }

  /// the name of the class
  final String name;

  /// the field names of the class
  final Iterable<Field> fields;
}
