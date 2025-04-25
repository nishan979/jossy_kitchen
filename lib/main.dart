import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jossy_kitchen/core/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Jossy Kitchen',
      // theme: ThemeData(
      //   primarySwatch: Colors.red,
      // ),
      initialRoute: Routes.home,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: true,
      themeMode: ThemeMode.light,

    );
  }
}
