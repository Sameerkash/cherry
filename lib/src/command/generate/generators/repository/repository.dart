import 'dart:io';

import 'package:cherry/src/util/file_util.dart';

class Repository {
  static final dir = Directory('lib');

  static createRepository() {
    print(dir.path);
    createStaticFile(
        '${dir.path}/lib/services/repository.dart ', 'This is repositpry file');
  }
}
