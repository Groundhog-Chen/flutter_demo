import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import './pages/fish_page/page.dart';
import './pages/grid_page/page.dart';
import './pages/list_page/page.dart';

void main() => runApp(createApp());

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'entrance_page': FishPage(),
      'grid_page': GridPage(),
      'list_page': ListPage(),
    },
  );

  return MaterialApp(
    title: 'FishDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('entrance_page', null),  //把他作为默认页面
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
