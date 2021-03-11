import 'dart:io';

import '../start/start.dart';

class Create {
  static void startFlutterCreate(
    String projectName,
    String projectDescription,
    String projectOrg,
    bool isKotlin,
    bool isSwift,
    bool isAndroidX,
  ) {
    //  mainDirectory = projectName + '/';

    final flutterArgs = makeArgs(projectName, projectDescription, projectOrg,
        isKotlin, isSwift, isAndroidX);

    Process.start('flutter', flutterArgs, runInShell: true).then((process) {
      // stdout.addStream(process.stdout);
      stderr.addStream(process.stderr);
      process.exitCode.then((exit) {
        if (exit == 0) {
          print("called");
          Start.start(directory: Directory(projectName));
        }
      });
    });
  }

  /// Create Arguments to pass to the initial flutter command for creating
  /// a project.
  static List<String> makeArgs(String projectName, String? projectDescription,
      String? projectOrg, bool isKotlin, bool isSwift, bool isAndroidX) {
    projectDescription = projectDescription ?? 'A new Cherry Picked Project';
    projectOrg = projectOrg ?? 'com.example';

    List<String> flutterArgs = ['create'];
    flutterArgs.add('--no-pub');

    if (isKotlin) {
      flutterArgs.add('-a');
      flutterArgs.add('kotlin');
    }

    if (isSwift) {
      flutterArgs.add('-i');
      flutterArgs.add('swift');
    }

    if (isAndroidX) {
      flutterArgs.add('--androidx');
    }

    flutterArgs.add('--project-name');
    flutterArgs.add('$projectName');

    if (projectDescription.isNotEmpty) {
      flutterArgs.add('--description');
      flutterArgs.add('$projectDescription');
    }

    if (projectOrg.isNotEmpty) {
      flutterArgs.add('--org');
      flutterArgs.add('$projectOrg');
    }

    flutterArgs.add(projectName);
    return flutterArgs;
  }
}
