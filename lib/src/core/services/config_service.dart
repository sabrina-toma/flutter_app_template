import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigService {
  static final ConfigService instance = ConfigService._instance();
  Map<String, dynamic>? configurations;

  factory ConfigService() {
    return instance;
  }

  ConfigService._instance();

  Future<void> loadConfig({required String flavor}) async {
    await dotenv.load(fileName: "assets/env/.$flavor.env");
    configurations = dotenv.env;
  }

  String get baseUrlApi => configurations?['baseUrlApi'] as String? ?? '';
  String get baseDomain => configurations?['baseDomain'] as String? ?? '';


  String get oneSignalAppId => configurations?['oneSignalAppId'] as String? ?? '';

  String get mapboxUrl => configurations?['mapboxUrl'] as String? ?? '';
  String get mapboxKey => configurations?['mapboxKey'] as String? ?? '';
  String get token => configurations?['token'] as String? ?? '';

  String get encryptionKey => configurations?['encryptionKey'] as String? ?? '';
  String get dbName => configurations?['dbName'] as String? ?? '';

}