import 'package:flutter/material.dart';
import './pages/home/home.dart';
import './pages/new_page/new_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {"new_page": (context, {text}) => NewRoute(text: text)},
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
