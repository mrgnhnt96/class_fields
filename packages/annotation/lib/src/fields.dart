import 'package:meta/meta_meta.dart';

// Specifies where [Fields] can be used
@Target({TargetKind.classType})

/// {@template fields}
/// The annotation for a class to generate keys for all fields.
/// {@endtemplate}
class Fields {
  /// {@macro fields}
  const Fields();
}

/// The annotation for a class to generate keys for all fields.
const fields = Fields();

///{@template field_key}
/// The annotation for a field to set the key for the field.
///
/// The key can also be set using JsonKey from json_serializable.
/// {@endtemplate}
class Field {
  ///{@macro field_key}
  const Field(this.key);

  /// the key for the field
  final String key;
}
