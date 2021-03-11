import '../base_command.dart';
import 'start.dart';

class StartCommand extends BaseCommand {
  @override
  final name = 'start';
  bool argsLength(int n) => argResults!.arguments.length > n;
  @override
  final description =
      'Create a basic structure for your project (confirm that you have no data in the \"lib\" folder).';

  StartCommand() {
    argParser.addFlag('complete',
        abbr: 'c',
        negatable: false,
        help:
            'Create a complete flutter project with Themes separated of main.dart, named Routes and locales Strings configured');

    argParser.addOption('provider-system',
        abbr: 'p',
        allowed: ['flutter_modular', 'bloc_pattern'],
        help: 'Create a flutter project using an specified provider system.');

    argParser.addOption('state-management',
        abbr: 's',
        allowed: ['mobx', 'flutter_bloc', 'rxdart'],
        help: 'Create a flutter project using an specified state management.');

    argParser.addFlag('force',
        abbr: 'f', negatable: false, help: 'Erase lib dir');
  }

  @override
  void run() {
    Start.start();
  }
}
