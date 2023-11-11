//import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesapmakinesi1/controller/home_controller.dart';
//import 'package:hesapmakinesi1/models/havaDurumu_model.dart';
//fluimport 'package:hesapmakinesi1/servis/havaDurumu_servis.dart';

class WeatherPage extends GetView {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: controller.isLoading.value == true
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: Container(
                    child: Column(
                      children: [
                        Text('Şehir: ' + controller.cityName.value),
                        Text('Derece: ' + controller.degree.value),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
