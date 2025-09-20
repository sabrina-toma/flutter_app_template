import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'src/core/constants/app_color.dart';
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
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: AppColor.secondary, statusBarIconBrightness: Brightness.light));

  await AppDateFormat.initializeLocale(const Locale('en', 'AU'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Flutter-App-Template',
            theme: AppTheme.lightTheme(context),
            darkTheme: AppTheme.darkTheme(context),
            getPages: Routes.routes,
            initialRoute: RoutesPath.splashScreen,
            initialBinding: SplashScreenBinding(),
          );
        }
    );
  }
}
