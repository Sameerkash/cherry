import 'package:cherry/src/command/generate/generators/repository/repository.dart';

import '../../../../../cherry.dart';

class RepositoryCommand extends BaseCommand {
  @override
  final name = 'repository';
  @override
  final description = 'Creates a repository with either Http or Dio instance';
  final abbr = 'r';

  @override
  void run() {
    Repository.createRepository();
  }
}
