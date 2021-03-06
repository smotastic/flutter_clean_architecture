import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/dogdetail/presentation/pages/dog_detail_page.dart';
import 'package:flutter_clean_architecture/service_locator.dart';

import 'features/dogcarousel/presentation/pages/dog_carousel_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinger',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DogCarouselPage(),
      routes: {
        DogDetailPage.routeName: (_) => DogDetailPage(),
      },
    );
  }
}
