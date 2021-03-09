import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/provider/store.dart';
import 'list_widget.dart';
import 'list.dart';
import 'videos.dart';
import 'profile.dart';
import '../player/player.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static BuildContext appContext;

  setUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', "喵喵喵~~");
  }

  @override
  void initState() {
    setUserName();
    super.initState();
  }

  @override
  void deactivate() {
    print('home deactivate');
    super.deactivate();
  }

  static onShowDialog() async {
    return showDialog<void>(
      context: appContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('提示'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('确定要把楼主关进小黑屋吗？'),
                // TextFormField(
                //   onChanged: (value) {
                //     print('$value');
                //   },
                //   validator: (String value) {
                //     return value.length >= 6 ? null : '账号最少6个字符';
                //   },
                // )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                '取消',
                style: TextStyle(color: Colors.black87),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                context.read<Counter>().decrement();
              },
            ),
            TextButton(
              child: Text('确认',
                  style: TextStyle(color: Color.fromRGBO(26, 167, 128, 1))),
              onPressed: () {
                Navigator.of(context).pop();
                context.read<Counter>().increment();
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
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color.fromRGBO(254, 149, 62, 1),
              child: Icon(
                Icons.add,
                size: 38.0,
              ),
              onPressed: () {
                setUserName();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PlayerPage()));
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            appBar: appBars.elementAt(_selectedIndex),
            body: bodyWidgets.elementAt(_selectedIndex),
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              elevation: 16,
              notchMargin: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    color: _selectedIndex == 0
                        ? Color.fromRGBO(1, 166, 121, 1)
                        : Color.fromRGBO(201, 202, 202, 1),
                    icon: Icon(Icons.whatshot),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                  ),
                  IconButton(
                    color: _selectedIndex == 1
                        ? Color.fromRGBO(1, 166, 121, 1)
                        : Color.fromRGBO(201, 202, 202, 1),
                    icon: Icon(Icons.live_tv),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                  ),
                  Text(''),
                  Text(''),
                  Text(''),
                  IconButton(
                    color: _selectedIndex == 2
                        ? Color.fromRGBO(1, 166, 121, 1)
                        : Color.fromRGBO(201, 202, 202, 1),
                    icon: Icon(Icons.queue_music),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                  ),
                  IconButton(
                    color: _selectedIndex == 3
                        ? Color.fromRGBO(1, 166, 121, 1)
                        : Color.fromRGBO(201, 202, 202, 1),
                    icon: Icon(Icons.account_circle),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                  )
                ],
              ),
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
