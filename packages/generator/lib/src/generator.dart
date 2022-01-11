import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:field_keys/domain/class.dart';
import 'package:field_keys/templates/field_keys_template.dart';
import 'package:field_keys_annotation/field_keys.dart';
import 'package:source_gen/source_gen.dart';

/// {@template field_keys_generator}
/// A [Generator] that generates all keys for fields
/// from the [FieldKeys] annotation
/// {@endtemplate}
class FieldKeysGenerator extends GeneratorForAnnotation<FieldKeys> {
  /// {@macro field_keys_generator}
  const FieldKeysGenerator();

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Generator cannot target `${element.runtimeType}`.',
        element: element,
      );
    }

    final buffer = StringBuffer();

    final subject = Class.fromElement(element);

    FieldKeysTemplate(subject).addToBuffer(buffer);

    return buffer.toString();
  }
}
