import 'package:get/get.dart';
import 'package:hesapmakinesi1/api/weather_service.dart';
//import 'package:hesapmakinesi1/routes/app_routes.dart';

class HomeController extends GetxController {
  final weatherService = WeatherService();

  var isLoading = false.obs;

  var cityName = ''.obs;
  var degree = '0 C'.obs;

  setCityName(String name) async {
    isLoading(true);
    cityName(name);
    try {
      final weatherResult = await weatherService.getWeather(name);
      degree('${weatherResult.temperature.round()}');
      isLoading(false);
      update();
    } catch (e) {
      print("HAVA DURUMU VERISI ALINAMADI!");
      print(e);
    }
  }
}
