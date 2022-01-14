<p align="center">
<h1 align="center">Class Fields</h1>
<h3 align="center">Generate all field names as Strings to use within Maps, serialization, etc!</h3>
</p>

<p align="center">
<a href="https://pub.dev/packages/class_fields"><img src="https://img.shields.io/pub/v/class_fields.svg" ></a>
<a href="https://github.com/mrgnhnt96/class_fields"><img src="https://img.shields.io/github/stars/mrgnhnt96/class_fields.svg?style=flat&logo=github&colorB=deeppink&label=stars" ></a>
<a href="https://pub.dev/packages/very_good_analysis"><img src="https://img.shields.io/badge/style-very_good_analysis-B22C89.svg" ></a>
<a href="https://github.com/tenhobi/effective_dart"><img src="https://img.shields.io/badge/style-effective_dart-40c4ff.svg" ></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg" ></a>
</p>

# Packages

[annotation]\
[generator]

# Purpose

When serializing to & from json, you need to provide the field names as `String`s for the keys to the map. Strings are great! ... just make sure to have the right format, you don't have any typos, and that if you ever update the string, that you don't forget to update all the places that also use that same string!

`class_fields` is a library that generates all the field names to help you keep your code DRY and type safe. `class_fields` creates a single reference point that can be used throughout your codebase.

# Usage

## Depend on it

Add `class_fields` and [`class_fields_annotations`][annotation] within your `pubspec.yaml`

```yaml
# annotations belong in the dependencies because they are used within your code
dependencies:
  class_fields_annotations: [recent_version]

# class_fields is only used to generate the code, and is not used within your codebase
# so it belongs in the dev_dependencies
dev_dependencies:
  class_fields: [recent_version]
  # needed to use class_fields
  build_runner: [recent_cersion]
```

## Use it

### Add the part file

```dart
part 'main.f.dart';
```

### Annotate your class

Decorate your class with the `@fields` annotation

```dart
@fields
class Person {
  const Person({
    required this.name,
    required this.age,
  });

  final String name;
  final int age;
}
```

### Run the [build_runner]

```bash
# run once
flutter packages pub run build_runner build --delete-conflicting-outputs

# run and listen to changes
flutter packages pub run build_runner watch --delete-conflicting-outputs

```

### Use the generated code

```dart
// generated code
class _$PersonFields {
  const _$PersonFields();

  final name = 'name';
  final age = 'age';
}
```

```dart
class Person {
  ...

// add a static instance of the generated class
static const fields = _$PersonFields();
}
```

```dart
// somewhere in your code
final value = map[Person.fields.name];

map[Person.fields.name] = value
```

[annotation]: https://pub.dev/packages/class_fields_annotation
[generator]: https://pub.dev/packages/class_fields
[build_runner]: https://pub.dev/packages/build_runner
