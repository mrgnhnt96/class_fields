import 'package:build/build.dart';
import 'package:fields/domain/settings.dart';
import 'package:fields/src/generator.dart';
import 'package:source_gen/source_gen.dart';

/// Not meant to be invoked by hand-authored code.
Builder fieldsBuilder(BuilderOptions options) {
  final settings = Settings.fromConfig(options.config);

  Formatter? formatter = (s) => s;

  if (settings.formatOuput) {
    formatter = null;
  }

  return PartBuilder(
    [const FieldsGenerator()],
    '.f.dart',
    formatOutput: formatter,
    header: '''
// ignore_for_file: avoid_field_initializers_in_const_classes
''',
  );
}

/// The formatter for the generated code.
typedef Formatter = String Function(String);
