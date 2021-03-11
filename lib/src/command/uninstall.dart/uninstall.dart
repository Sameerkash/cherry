import 'dart:io';

import '../../util/util.dart';
import '../../util/output_util.dart' as output;

Future<void> uninstall(List<String> packs, bool isDev,
    [bool showErrors = true, String? directory]) async {
  final spec = await getPubSpec(
      directory: directory == null ? null : Directory(directory));
  var dependencies = isDev ? spec.devDependencies : spec.dependencies;
  final yaml =
      File(directory == null ? 'pubspec.yaml' : '$directory/pubspec.yaml');
  var node = yaml.readAsLinesSync();
  var isAlter = false;

  for (final pack in packs) {
    if (!dependencies.containsKey(pack)) {
      if (showErrors) {
        output.error('Package is not installed');
      }
      continue;
    }
    isAlter = true;
    node.removeWhere((t) => t.contains('  $pack:'));

    output.success('Removed $pack from pubspec');
  }

  if (isAlter) {
    yaml.writeAsStringSync(node.join('\n') + '\n');
  }
}
