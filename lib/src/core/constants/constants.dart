
import '../services/config_service.dart';

class Constants{
  static bool isProdActive = false;

  static String baseUrlApi = ConfigService.instance.baseUrlApi;
  static String baseDomain = ConfigService.instance.baseDomain;

  /// Mapbox api token key
  static  String mapBoxTokenKey = ConfigService.instance.mapboxKey;
  static  String mapboxUrl =  ConfigService.instance.mapboxUrl;
  static  String mapboxKey =  ConfigService.instance.mapboxKey;


  static String encryptionKey = ConfigService.instance.encryptionKey;

}