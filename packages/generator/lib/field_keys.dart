import 'package:build/build.dart';
import 'package:field_keys/domain/settings.dart';
import 'package:field_keys/src/generator.dart';
import 'package:source_gen/source_gen.dart';

/// Not meant to be invoked by hand-authored code.
Builder fieldKeysBuilder(BuilderOptions options) {
  final settings = Settings.fromConfig(options.config);

  Formatter? formatter = (s) => s;

  if (settings.formatOuput) {
    formatter = null;
  }

  return PartBuilder(
    [const FieldKeysGenerator()],
    'keys.dart',
    formatOutput: formatter,
  );
}

/// The formatter for the generated code.
typedef Formatter = String Function(String);
