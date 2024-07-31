import 'package:bakery_app_ui/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: themeData,
          home: const HomePage(),
        );
      },
    );
  }
}
