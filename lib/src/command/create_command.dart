import 'package:args/command_runner.dart';
import 'package:cherry/src/command/base_command.dart';

class CreateCommand extends BaseCommand {
  @override
  final name = 'create';

  @override
  final description = 'Create a new Flutter project.';

  @override
  final invocationSuffix = '<project name>';

  CreateCommand() {
    argParser.addOption('description',
        abbr: 'd',
        help:
            'The description to use for your new Flutter project. This string ends up in the pubspec.yaml file. (defaults to \"A new Flutter project. Created by Slidy\")');

    argParser.addOption('org',
        abbr: 'o',
        help:
            'The organization responsible for your new Flutter project, in reverse domain name notation. This string is used in Java package names and as prefix in the iOS bundle identifier. (defaults to \"com.example\")');
  }
}
