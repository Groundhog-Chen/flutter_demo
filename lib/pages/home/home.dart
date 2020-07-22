import 'package:flutter/material.dart';
import 'list_widget.dart';
import 'list.dart';
import 'videos.dart';
import 'profile.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static BuildContext appContext;

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    print('home deactivate');
    super.deactivate();
  }

  void _onItemTapped(int index) {
    // if (index == 2) {
    //   Navigator.push(
    //       appContext,
    //       MaterialPageRoute(
    //           builder: (BuildContext context) => NewRoute(text: '播放页')));
    //   return;
    // }
    setState(() {
      _selectedIndex = index;
    });
  }

  static onShowDialog() async {
    return showDialog<void>(
      context: appContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('关于'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              child: Text('确认'),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Tab 列表内容
  List<Widget> bodyWidgets = <Widget>[
    TabBarView(
        children: <Widget>[ListWidget(), Text('2'), Text('3'), Text('4')]),
    VideosWidget(),
    ListPage(),
    ProfileWidget(),
  ];

  // AppBar 内容
  List<Widget> appBars = <Widget>[
    AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: TabBar(
        isScrollable: true,
        labelColor: Colors.black,
        indicatorColor: Colors.white,
        labelStyle: TextStyle(fontSize: 21.0),
        unselectedLabelStyle: TextStyle(fontSize: 14.0),
        tabs: choices.map((Choice choice) {
          return Tab(text: choice.title);
        }).toList(),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.all_inclusive),
          onPressed: onShowDialog,
        )
      ],
      // bottom: ,
    ),
    AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          '视频',
          style: TextStyle(
            color: Colors.black,
          ),
        )),
    AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text('列表', style: TextStyle(color: Colors.black))),
    AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text('个人中心', style: TextStyle(color: Colors.black))),
  ];

  @override
  Widget build(BuildContext context) {
    appContext = context;
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: appBars.elementAt(_selectedIndex),
            body: bodyWidgets.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.blue,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.track_changes), title: Text('推荐')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.live_tv), title: Text('视频')),
                // BottomNavigationBarItem(
                //     icon: Icon(
                //       Icons.play_circle_outline,
                //       size: 40,
                //     ),
                //     title: Text(' ')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.queue_music), title: Text('列表')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), title: Text('我的')),
              ],
              fixedColor: Colors.blue,
              selectedFontSize: 10.0,
              unselectedItemColor: Colors.grey,
              currentIndex: _selectedIndex,
              unselectedFontSize: 10.0,
              onTap: _onItemTapped,
            )),
      ),
    );
  }
}

class Choice {
  const Choice({this.title});
  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '今日推荐'),
  const Choice(title: '猜你喜欢'),
  const Choice(title: '排行榜'),
  const Choice(title: '乐库'),
];
