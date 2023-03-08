import 'package:flutter/material.dart';
import 'package:project8/screens/details.dart';
import 'package:project8/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Country-Capital'),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/details':
            var data = settings.arguments as info;
            return MaterialPageRoute(builder: (context) => Details(item: data));
        }
      },
    );
  }
}
