import 'package:flutter/material.dart';
import 'package:hesapmakinesi1/routes/app_pages.dart';
import 'package:hesapmakinesi1/routes/app_routes.dart';
import 'package:hesapmakinesi1/utils/app_binding.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

void main() => runApp(Provider<CustomSearchDelegate>(
    create: (BuildContext context) {
      return CustomSearchDelegate();
    },
    child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      initialRoute: AppRoutes.HOME,
      initialBinding: AppBinding(),
      getPages: AppPages.list,
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'İstanbul',
    'Adana',
    'İzmir',
    'Sivas',
    'Ankara',
    'Bursa',
    'Kars',
    'Konya',
    'Antalya',
    'Yozgat',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  //ARAMA EKRANINDAN GERİ ÇIKMA
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [Text(query)]),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () {
              debugPrint(matchQuery[index]);
              query = result;
              showResults(context);
              close(context, null);
              debugPrint(query);
            },
          );
        });
  }
}
