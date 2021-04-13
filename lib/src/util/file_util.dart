import 'dart:io';
import 'output_util.dart' as output;

void createStaticFile(String path, String content) async {
  try {
    var file = File(path)
      ..createSync(recursive: true)
      ..writeAsStringSync(content);

    await formatFile(file);
  } catch (e) {
    output.error(e);
    exit(1);
  }
}

Future<void> formatFile(File file) async {
  await Process.run('flutter', ['format', file.absolute.path],
      runInShell: true);
}
