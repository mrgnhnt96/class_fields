import 'package:field_keys/domain/class.dart';
import 'package:field_keys/domain/field.dart';
import 'package:field_keys/templates/template.dart';
import 'package:field_keys/util/string_buffer_ext.dart';

/// {@template field_keys_template}
/// The template for the field keys
/// {@endtemplate}
class FieldKeysTemplate extends Template {
  /// {@macro field_keys_template}
  const FieldKeysTemplate(Class subject) : super(subject);

  @override
  void generate(StringBuffer buffer) {
    buffer.writeObject(
      'class ${subject.genName}',
      body: () {
        buffer
          ..writeln('const ${subject.genName}();')
          ..writeln()
          ..writeAll(subject.fields.instanciators, '\n')
          ..writeln();
      },
    );
  }
}

extension on Class {
  String get genName {
    return '_\$${name}FieldKeys';
  }
}

extension on Iterable<Field> {
  Iterable<String> get instanciators {
    return map((field) => "final ${field.name} = '${field.name}';");
  }
}
