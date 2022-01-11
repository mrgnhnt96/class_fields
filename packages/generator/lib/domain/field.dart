import 'package:analyzer/dart/element/element.dart';

/// {@template field}
/// The field of the class
/// {@endtemplate}
class Field {
  /// {@template field}
  const Field({
    required this.name,
  });

  /// gets the field from the [FieldElement]
  factory Field.fromElement(FieldElement element) {
    return Field(
      name: element.name,
    );
  }

  /// the name of the field
  final String name;

  /// gets all the fields from the [FieldElement]s
  static Iterable<Field> fromElements(Iterable<FieldElement> elements) sync* {
    if (elements.isEmpty) {
      return;
    }

    for (final element in elements) {
      // [element.isSynthetic] is true for fields that are
      // declared getters
      // Ignore all static fields
      if (element.isSynthetic || element.isStatic) {
        continue;
      }

      yield Field.fromElement(element);
    }
  }
}
