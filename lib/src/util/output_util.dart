import 'package:ansicolor/ansicolor.dart';


AnsiPen red = AnsiPen()..red();
AnsiPen green = AnsiPen()..green();
AnsiPen white = AnsiPen()..white();
AnsiPen yellow = AnsiPen()..yellow();

void success(msg) => print(green('$msg'));
void title(msg) => print(green('$msg'));
void warn(msg) => print(yellow('$msg'));
void error(msg) => print(red('ERROR: $msg'));
void msg(msg) => print(white(msg));
