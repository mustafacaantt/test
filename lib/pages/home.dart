//import 'dart:async';

// ignore_for_file: prefer_const_constructors

//import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesapmakinesi1/controller/home_controller.dart';
//import 'package:hesapmakinesi1/models/havaDurumu_model.dart';
import 'package:hesapmakinesi1/routes/app_routes.dart';
import 'package:lottie/lottie.dart';
//import 'package:hesapmakinesi1/servis/havaDurumu_servis.dart';

class HomePage extends GetView {
  HomePage({super.key});

  final cityTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Color(0xFF34495E),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                'Bu Havada Ne ?',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
            ),
            const Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.3,
            )),
            Expanded(
              flex: 0,
              child: Container(
                child: Lottie.asset('assets/anasayfa.json'),
              ),
            ),
            Align(
              child: Text(
                'Yaşadığın şehirin hava durumu şuan nasıl?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.2,
            )),
            Align(
              child: Text(
                'Hadi birlikte bakalım şuanda hava nasıl görünüyor?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            const Flexible(
                child: FractionallySizedBox(
              heightFactor: 2,
            )),
            Expanded(
              flex: 0,
              child: new TextField(
                controller: cityTextController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "T",
                    fillColor: Colors.white70),
              ),
            ),
            const Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.1,
            )),
            ElevatedButton(
              onPressed: () {
                controller.setCityName(cityTextController.text);
                Get.toNamed(AppRoutes.WEATHER);
              },
              child: Text('Ülkes'),
            )
          ],
        ),
      );
    });
  }
}

// genymotion

// String sehirr = '';

// class WeatherPage extends StatefulWidget {
//   const WeatherPage({super.key});

//   @override
//   State<WeatherPage> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<WeatherPage> {
//   final _weatherService = HavaDurumuServis('a85302752aa661dbfead915c2d2bc62a');
//   Weather? _weather;
//   String cityName = 'Sivas';
//   _fetchWeather() async {
//     try {
//       final weather = await _weatherService.getWeather(cityName);
//       setState(() {
//         _weather = weather;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     _fetchWeather();
//   }

//   @override
//   void tik() {
//     showCountryPicker(
//       context: context,
//       onSelect: (Country country) {
//         cityName = country.name;
//         debugPrint(sehirr);
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("HAVANE"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               showSearch(context: context, delegate: CustomSearchDelegate());
//             },
//             icon: const Icon(Icons.search),
//           )
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(onPressed: tik, child: Text("Ülkelerrr")),

//             //TEST
//             Text(sehirr),
//             //Şehir Adı
//             Text(_weather?.cityName ?? "loindi city"),

//             //Animasyon

//             //Derece
//             Text('${_weather?.temperature.round()}C'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomSearchDelegate extends SearchDelegate {
//   List<String> searchTerms = [
//     'İstanbul',
//     'Adana',
//     'İzmir',
//     'Sivas',
//     'Ankara',
//     'Bursa',
//     'Kars',
//     'Konya',
//     'Antalya',
//     'Yozgat',
//   ];

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       )
//     ];
//   }

//   //ARAMA EKRANINDAN GERİ ÇIKMA
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(children: [Text(query)]),
//       ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var fruit in searchTerms) {
//       if (fruit.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(fruit);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuery.length,
//         itemBuilder: (context, index) {
//           var result = matchQuery[index];
//           return ListTile(
//             title: Text(result),
//             onTap: () {
//               debugPrint(matchQuery[index]);
//               query = result;
//               showResults(context);
//               close(context, null);
//               debugPrint(query);
//             },
//           );
//         });
//   }
// }
