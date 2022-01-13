import 'package:fields/domain/class.dart';
import 'package:fields/domain/field.dart';
import 'package:fields/templates/template.dart';
import 'package:fields/util/string_buffer_ext.dart';

/// {@template fields_template}
/// The template for the field keys
/// {@endtemplate}
class FieldsTemplate extends Template {
  /// {@macro fields_template}
  const FieldsTemplate(Class subject) : super(subject);

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
    return '_\$${name}Fields';
  }
}

extension on Iterable<Field> {
  Iterable<String> get instanciators {
    return map((field) => "final ${field.cleanName} = '${field.key}';");
  }
}
