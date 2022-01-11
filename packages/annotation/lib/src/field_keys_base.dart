import 'package:meta/meta_meta.dart';

// Specifies where [fieldKeys] can be used
@Target({TargetKind.classType})

/// {@template field_keys}
/// The annotation for a class to generate keys for all fields.
/// {@endtemplate}
class FieldKeys {
  /// {@macro field_keys}
  const FieldKeys();
}

/// The annotation for a class to generate keys for all fields.
const fieldKeys = FieldKeys();

///{@template field_key}
/// The annotation for a field to set the key for the field.
///
/// The key can also be set using JsonKey from json_serializable.
/// {@endtemplate}
class FieldKey {
  ///{@macro field_key}
  const FieldKey(this.key);

  /// the key for the field
  final String key;
}
