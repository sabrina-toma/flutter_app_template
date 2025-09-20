
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

  /// Cloudinary
  static String CLOUDINARY_API = ConfigService.instance.CLOUDINARY_API;
  static String CLOUDINARY_API_SECRET = ConfigService.instance.CLOUDINARY_API_SECRET;
  static String CLOUDINARY_API_KEY = ConfigService.instance.CLOUDINARY_API_KEY;
  static String CLOUDINARY_CLOUD_NAME = ConfigService.instance.CLOUDINARY_CLOUD_NAME;
  static String PUBLIC_CLOUDINARY_UPLOAD_PRESET = ConfigService.instance.PUBLIC_CLOUDINARY_UPLOAD_PRESET;

}