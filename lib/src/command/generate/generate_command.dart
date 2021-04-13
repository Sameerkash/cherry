import 'package:args/command_runner.dart';
import 'package:cherry/src/command/generate/generators/repository/repository_command.dart';

import '../../../cherry.dart';

class GenerateCommand extends BaseCommand {
  @override
  final name = 'generate';
  @override
  final description =
      'Creates a View, ViewModel, Controller, Widget or Repository according to the option.';
  final abbr = 'g';

  GenerateCommand() {
    addSubcommand(RepositoryCommand());
  }
}

class GenerateCommandAbbr extends GenerateCommand {
  @override
  final name = 'g';
}
