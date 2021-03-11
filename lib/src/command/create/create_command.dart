import 'package:args/command_runner.dart';

import '../base_command.dart';
import 'create.dart';

class CreateCommand extends BaseCommand {
  @override
  final name = 'create';

  @override
  final description = 'Creates a new Cherry Picked Flutter project.';

  @override
  final invocationSuffix = '<project name>';

  CreateCommand() {
    argParser.addOption('description',
        abbr: 'd',
        help:
            'The description to use for your new Flutter project. This string ends up in the pubspec.yaml file. (defaults to \" A Cherry Picked Project\")');

    argParser.addOption('org',
        abbr: 'o',
        help:
            'The organization responsible for your new Flutter project, in reverse domain name notation. This string is used in Java package names and as prefix in the iOS bundle identifier. (defaults to \"com.example\")');

    argParser.addFlag('kotlin',
        abbr: 'k', negatable: false, help: 'use kotlin in Android project');

    argParser.addFlag('swift',
        abbr: 's', negatable: false, help: 'use swift in ios project');

    argParser.addFlag('androidx',
        abbr: 'x', negatable: false, help: 'use androidx on android project');
  }

  @override
  void run() {
    if (argResults!.rest.isEmpty) {
      throw UsageException(
          'project name not passed for a create command', usage);
    } else {
      Create.startFlutterCreate(
        argResults!.rest.first,
        argResults!['description'] ?? "A new Cherry pciked flutter project",
        argResults!['org'] ?? 'com.example',
        argResults!['kotlin'],
        argResults!['swift'],
        argResults!['androidx'],
      );
    }
  }
}
