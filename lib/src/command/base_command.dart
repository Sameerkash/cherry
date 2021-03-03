
import 'package:args/command_runner.dart';

class BaseCommand extends Command {
  String? invocationSuffix;
  @override
  String get invocation {
    return invocationSuffix != null && invocationSuffix!.isNotEmpty
        ? '${super.invocation} $invocationSuffix'
        : '${super.invocation}';
  }

  @override
  String get description => throw Error();

  @override
  String get name => throw Error();
}
