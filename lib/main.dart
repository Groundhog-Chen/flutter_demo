import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/provider/store.dart';
import './pages/home/home.dart';
import './pages/new_page/new_page.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(253, 253, 253, 1),
          platform: TargetPlatform.iOS,
          buttonTheme:
              ButtonThemeData(buttonColor: Color.fromRGBO(26, 167, 128, 1)),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              foregroundColor: Color.fromRGBO(26, 167, 128, 1),
              backgroundColor: Color.fromRGBO(26, 167, 128, 1)),
          primaryColor: Color.fromRGBO(26, 167, 128, 1)),
      routes: {"new_page": (context, {text}) => NewRoute(text: text)},
      home: MyHomePage(title: 'Flutter 播放器'),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

        /// Calls `context.watch` to make [MyHomePage] rebuild when [Counter] changes.
        '${context.watch<Counter>().count}',
        style: Theme.of(context).textTheme.headline4);
  }
}
