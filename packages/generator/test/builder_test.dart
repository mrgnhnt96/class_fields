import 'package:class_fields/domain/settings.dart';
import 'package:class_fields/fields.dart';
import 'package:generator_test/generator_test.dart';
import 'package:test/test.dart';

void main() {
  const files = [
    'basic',
    'private',
    'with_getter',
    'with_static',
    'with_key_annotation',
  ];

  for (final file in files) {
    test(
      'Successfully generates $file',
      () async {
        final tester = GeneratorTester.fromBuilder(
          file,
          fieldsBuilder,
          onLog: print,
          logLevel: Level.ALL,
          options: Settings.debug(),
        );

        await tester.test();
      },
    );
  }
}
