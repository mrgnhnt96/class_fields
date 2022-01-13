// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:fields_annotation/fields.dart';
import 'package:source_gen/source_gen.dart';

/// {@template field}
/// The field of the class
/// {@endtemplate}
class Field {
  /// {@template field}
  const Field({
    required this.name,
    required String? key,
  }) : key = key ?? name;

  /// gets the field from the [FieldElement]
  factory Field.fromElement(FieldElement element) {
    String? checkForKey(Iterable<ElementAnnotation> annotations) {
      if (annotations.isEmpty) {
        return null;
      }

      String? getName(ElementAnnotation element, String field) {
        final reader = ConstantReader(element.computeConstantValue());

        final result = reader.peek(field)?.literalValue as String?;

        return result;
      }

      for (final annotation in annotations) {
        if (annotation.astName == 'JsonKey') {
          return getName(annotation, 'name');
        } else if (annotation.astName == '$Field') {
          return getName(annotation, 'key');
        }
      }
    }

    return Field(
      name: element.name,
      key: checkForKey(element.metadata),
    );
  }

  /// the name of the field
  final String name;

  /// the name of the field, removing all `_`
  String get cleanName {
    return name.replaceAll(RegExp('^_*'), '');
  }

  /// the key of the field
  ///
  /// set to [name] if not set
  final String key;

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

extension on ElementAnnotation {
  String get astName {
    if (element == null) {
      throw ArgumentError.notNull('element');
    }

    if (this is! ElementAnnotationImpl) {
      return element!.displayName;
    }

    return (this as ElementAnnotationImpl).annotationAst.name.name;
  }
}
