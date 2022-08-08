import 'package:flutter/material.dart';
import 'package:new_cvsender/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
      theme:
          ThemeData(primaryColor: Colors.amber, brightness: Brightness.light),
      // darkTheme: ThemeData(
      //     primaryColor: Colors.blueGrey.shade200, brightness: Brightness.dark),
      home: const HomePage(),
    );
  }
}
