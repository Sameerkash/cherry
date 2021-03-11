import 'dart:convert';
import 'dart:io';
import '../util/util.dart';
import 'package:http/http.dart' as http;

class PubService {
  Future<String> getPackage(String pack, String version) async {
    var url = _getUrl() + '/$pack';

    if (version.isNotEmpty) {
      url += '/versions/$version';
    }

    http.Response response = await http.get(Uri(path: url));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var map = version.isEmpty ? json['latest']['pubspec'] : json['pubspec'];
      return map['version'];
    } else {
      throw Exception('error');
    }
  }

  String _getUrl() {
    var URLBase = 'https://pub.dev';

    final envVars = Platform.environment;
    final URLBaseEnv = envVars['PUB_HOSTED_URL'];

    if (URLBaseEnv != null && validateUrl(URLBaseEnv)) {
      URLBase = URLBaseEnv;
    }

    return '$URLBase/api/packages';
  }
}
