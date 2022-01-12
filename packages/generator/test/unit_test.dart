import 'package:test/test.dart';

import 'fixture/basic.dart' as i1;
import 'fixture/with_getter.dart' as i2;
import 'fixture/with_key_annotation.dart' as i4;
import 'fixture/with_static.dart' as i3;
import 'util/mapped_all_fields.dart';

void main() {
  final tests = [
    UnitTest(
      groupName: 'basic',
      type: i1.Person,
      checkKeyValues: () {
        const keys = i1.Person.keys;

        expect(keys.name, 'name');
        expect(keys.age, 'age');
      },
    ),
    UnitTest(
      groupName: 'with_getter',
      type: i2.Person,
      checkKeyValues: () {
        const keys = i2.Person.keys;

        expect(keys.name, 'name');
        expect(keys.age, 'age');
      },
    ),
    UnitTest(
      groupName: 'with_static',
      type: i3.Person,
      checkKeyValues: () {
        const keys = i3.Person.keys;

        expect(keys.name, 'name');
        expect(keys.age, 'age');
      },
    ),
    UnitTest(
      groupName: 'with_key_annotation',
      type: i4.Person,
      checkKeyValues: () {
        const keys = i4.Person.keys;

        expect(keys.name, 'something_cooler');
        expect(keys.age, 'edad');
      },
    ),
  ];

  for (final test in tests) {
    test.run();
  }
}

class UnitTest {
  const UnitTest({
    required this.type,
    required this.checkKeyValues,
    required this.groupName,
    String? keysName,
  }) : keysName = keysName ?? 'keys';

  final Type type;
  final void Function() checkKeyValues;
  final String keysName;
  final String groupName;

  void run() {
    group(groupName, () {
      checkValues();
      testMapped();
    });
  }

  void checkValues() {
    test(
      'keys should return field names or annotated value',
      checkKeyValues,
    );
  }

  void testMapped() {
    test(
      'all fields should be mapped to keys',
      () {
        final result = mappedAllFields(type, keysName);

        expect(result, isTrue);
      },
    );
  }
}
