import 'package:flutter/material.dart';
import 'package:flutter_http_test/screens/home_screen.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.orange[200],
        appBarTheme: const AppBarTheme(elevation: 0.0),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
