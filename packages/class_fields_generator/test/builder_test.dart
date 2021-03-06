import 'package:generator_test/generator_test.dart';
import 'package:test/test.dart';

import 'package:class_fields/class_fields.dart';
import 'package:class_fields/domain/settings.dart';

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
        final tester = SuccessGenerator.fromBuilder(
          file,
          classFieldsBuilder,
          onLog: print,
          logLevel: Level.ALL,
          options: Settings.debug(),
        );

        await tester.test();
      },
    );
  }
}
