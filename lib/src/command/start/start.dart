import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cherry/src/command/generate/generate_command.dart';

import '../install/install.dart';
import '../../util/util.dart';
import 'package:dart_console/dart_console.dart';
import '../../util/output_util.dart' as output;

class Start {
  static void start({Directory? directory}) async {
    directory ??= Directory('lib');
    var selectedIndex = 0;

    selectedIndex = stateCLIOptions(
        "Choose an option", ["standard", "customize", "minimal"]);
    if (selectedIndex == 1) {
      output.warn("Coming Soon");
    } else if (selectedIndex == 2) {
      output.warn("Coming Soon");
    } else if (selectedIndex == -1) {
      output.error("please selected a valid option");
    } else {
      await standardInstall(directory.path);
    }
  }

  static standardInstall(String directory) async {
    await removeAllPackages(directory);

    output.title('installing dependencies 🔨');
    await Install.install([
      'hooks_riverpod',
      'flutter_hooks',
      'auto_route',
      'freezed_annotation',
      'json_annotation',
      'dartz',
      'auto_size_text',
      'sembast'
    ], false, directory: directory);
    await Install.install(
        ['freezed', 'build_runner', 'auto_route_generator', 'lint'], true,
        directory: directory);

    var command = CommandRunner('cherry',
        'Dart CLI template generator and package manager for flutter, generate MVC, MVVM and MVU patterns');
    command.addCommand(GenerateCommand());
    await command.run(['generate', 'repository']);
    output.success('Your cherry🍒 picked flutter project is ready');
    exit(0);
  }

  static int stateCLIOptions(String title, List<String> options) {
    stdin.echoMode = false;
    stdin.lineMode = false;
    var console = Console();
    var isRunning = true;
    var selected = 0;

    while (isRunning) {
      print('\x1B[2J\x1B[0;0H');
      output.title('Cherry Interative CLI\n');
      output.warn(title);
      for (var i = 0; i < options.length; i++) {
        if (selected == i) {
          print(output.green(options[i]));
        } else {
          print(output.white(options[i]));
        }
      }

      print('\nUse ↑↓ (keyboard arrows)');
      print('Press \'q\' to quit.');

      var key = console.readKey();

      if (key.controlChar == ControlCharacter.arrowDown) {
        if (selected < options.length - 1) {
          selected++;
        }
      } else if (key.controlChar == ControlCharacter.arrowUp) {
        if (selected > 0) {
          selected--;
        }
      } else if (key.controlChar == ControlCharacter.enter) {
        isRunning = false;
        return selected;
      } else if (key.char == 'q') {
        return -1;
      } else {}
    }
    return -1;
  }
}
