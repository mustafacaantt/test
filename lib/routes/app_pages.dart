import 'package:get/get.dart';
import 'package:hesapmakinesi1/pages/home.dart';
import 'package:hesapmakinesi1/pages/weather.dart';
import 'package:hesapmakinesi1/routes/app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.WEATHER,
      page: () => WeatherPage(),
    ),
  ];
}
