import 'dart:io';

import 'package:yaml/yaml.dart';

import '../command/uninstall.dart/uninstall.dart';
import 'pubspec_util.dart';

bool validateUrl(String url) {
  var urlPattern =
      r'(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?';
  var match = RegExp(urlPattern, caseSensitive: false).firstMatch(url);
  return match != null ? true : false;
}

Future removeAllPackages([String? directory]) async {
  var pubSpec = await getPubSpec(
      directory: directory == null ? null : Directory(directory));
  var dep = pubSpec.dependencies.keys
      .map((f) => f.toString())
      .where((t) => t != 'flutter')
      .toList();

  var devDep = pubSpec.devDependencies.keys
      .map((f) => f.toString())
      .where((t) => t != 'flutter_test')
      .toList();

  await uninstall(dep, false, false, directory);
  await uninstall(devDep, true, false, directory);

  // pubSpec.dependencies.removeWhere((key, value) => key != 'flutter');
  // pubSpec.devDependencies.removeWhere((key, value) => key != 'flutter_test');
  // var newPubSpec = pubSpec.copy(
  //     dependencies: pubSpec.dependencies,
  //     devDependencies: pubSpec.devDependencies);
  // await newPubSpec.save(Directory(''));
}

Future<String> getVersion() async {
  //PubSpec yaml = await getPubSpec(path: File.fromUri(Platform.script).parent.parent.path);
  final file =
      File(File.fromUri(Platform.script).parent.parent.path + '/pubspec.lock');
  var doc = loadYaml(await file.readAsString());
  return doc['packages']['slidy']['version'].toString();
}

String mainDirectory = '';

Future<PubSpec> getPubSpec({Directory? directory}) async {
  var pubSpec = await PubSpec.load(directory ?? Directory('$mainDirectory'));
  return pubSpec;
}
