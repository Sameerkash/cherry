class GeneratorArgs {
  final String name;
  final String packageName;
  late String? import;
  late String? type;
  late String? pathModule;
  GeneratorArgs({
    required this.name,
    required this.packageName,
    this.import,
    this.type,
    this.pathModule,
  });
}
