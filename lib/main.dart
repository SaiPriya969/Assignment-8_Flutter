import 'package:flutter/material.dart';
import 'package:project8/providers/listProvider.dart';
import 'package:project8/screens/details.dart';
import 'package:project8/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => updateProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Country-Capital'),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/details':
              var data = settings.arguments as dataInterface;

              return MaterialPageRoute(
                  builder: (context) => Details(
                        index: data.ind,
                        id: data.id,
                      ));
          }
        },
      ),
    );
  }
}

class dataInterface {
  late int ind;
  late int id;
  dataInterface(this.ind, this.id);
}
