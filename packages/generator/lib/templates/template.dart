import 'package:field_keys/domain/class.dart';

///{@template template}
/// The interface for all templates
/// {@endtemplate}
abstract class Template {
  /// {@macro template}
  const Template(this.subject);

  /// the [Class] of the template to generate code for
  final Class subject;

  /// Add the template ([generate]) to the given [buffer]
  void addToBuffer(StringBuffer buffer) {
    generate(buffer);
  }

  /// Generate the template
  void generate(StringBuffer buffer);

  @override
  String toString() {
    final buffer = StringBuffer();
    generate(buffer);

    return buffer.toString();
  }
}
