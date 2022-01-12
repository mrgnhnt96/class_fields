import 'dart:mirrors';

bool mappedAllFields(Type classType, String keysFieldName) {
  final subject = reflectType(classType) as ClassMirror;

  final keys = subject.staticMembers[Symbol(keysFieldName)];

  if (keys == null) {
    throw Exception('No keys found');
  }

  final subjectKeys = subject.declarations.values.where((e) {
    if (e is! VariableMirror) {
      return false;
    }

    return !e.isStatic;
  });

  final fieldKeys = (keys.returnType as ClassMirror)
      .declarations
      .values
      .whereType<VariableMirror>()
      .toList();

  for (final key in subjectKeys) {
    final index = fieldKeys.simpleIndex(key);
    if (index == -1) {
      return false;
    }

    fieldKeys.removeAt(index);
    continue;
  }

  if (fieldKeys.isNotEmpty) {
    return false;
  }

  return true;
}

extension on List<VariableMirror> {
  int simpleIndex(DeclarationMirror element) {
    for (var i = 0; i < length; i++) {
      if (this[i].simpleName == element.simpleName) {
        return i;
      }
    }
    return -1;
  }
}
