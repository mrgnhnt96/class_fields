/// {@template settings}
/// The configuration from the build.yaml file
/// {@endtemplate}
class Settings {
  /// {@macro settings}
  const Settings({
    required this.formatOuput,
  });

  /// constructs a [Settings] from the build.yaml file
  factory Settings.fromConfig(Map<String, dynamic> json) {
    return Settings(
      formatOuput: json['format_ouput'] as bool? ?? false,
    );
  }

  /// Whether to format the output of the generated code.
  final bool formatOuput;
}
