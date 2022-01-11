import 'package:field_keys/domain/settings.dart';
import 'package:field_keys/field_keys.dart';
import 'package:generator_test/generator_test.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Successfully generates',
    () async {
      await testPackageBuilder(
        'basic',
        builder: fieldKeysBuilder,
        builderOptions: Settings.debug(),
        extension: '.keys.dart',
      );
    },
  );
}
