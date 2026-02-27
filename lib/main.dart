import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_template/src/core/controller/app_controller.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'src/core/constants/app_date_time_format.dart';
import 'src/core/services/config_service.dart';
import 'src/core/themes/app_theme.dart';
import 'src/features/splash_screen/application/bindings/splash_screen_binding.dart';
import 'src/routes/route_paths.dart';
import 'src/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ConfigService.instance.loadConfig(flavor: "dev");

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(statusBarColor: Get.context!.colors.secondary, statusBarIconBrightness: Brightness.light));

  await AppDateFormat.initializeLocale(const Locale('en', 'AU'));

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final AppController _appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Flutter-App-Template',
            theme: _appController.isDarkMode.value ? AppTheme.dark : AppTheme.light,
            darkTheme: AppTheme.dark,
            getPages: Routes.routes,
            initialRoute: RoutesPath.splashScreen,
            initialBinding: SplashScreenBinding(),
          );
        }
    );
  }
}
