import 'package:args/command_runner.dart';

import '../base_command.dart';
import 'install.dart';

class InstallCommand extends BaseCommand {
  @override
  final name = 'install';
  @override
  final description = 'Install (or update) a new package or packages:';

  InstallCommand() {
    argParser.addFlag('dev',
        negatable: false,
        help: 'Install (or update) a package in a dev dependency');
  }

  @override
  void run() {
    if (argResults!.rest.isEmpty) {
      throw UsageException('value not passed for a module command', usage);
    } else {
      Install.install(argResults!.rest, argResults!['dev']);
    }
  }
}
