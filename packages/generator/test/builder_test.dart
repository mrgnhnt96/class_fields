import 'package:fields/domain/settings.dart';
import 'package:fields/fields.dart';
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
        await testPackageBuilder(
          file,
          builder: fieldsBuilder,
          builderOptions: Settings.debug(),
        );
      },
    );
  }
}
