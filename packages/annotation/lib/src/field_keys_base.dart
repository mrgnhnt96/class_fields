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
