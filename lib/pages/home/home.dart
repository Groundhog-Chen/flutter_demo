import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../new_page/new_page.dart';
// import 'widget1.dart';
import 'list_widget.dart';

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
    setState(() {
      _selectedIndex = index;
    });
  }

  void onShowDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('选择'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('选项 1'),
              onPressed: () {                                  
                Navigator.of(context).pop();
              },
            ),
            SimpleDialogOption(
              child: Text('选项 2'),
              onPressed: () {
                Navigator.of(context).pop();
                return '21';
              },
            ),
          ],
        );
      },
    ).then((val) {
      print(val);
    });
  }
  // Tab 列表内容
  List<Widget> bodyWidgets = <Widget>[
      TabBarView(children: <Widget>[
        ListWidget(),
        Text('2'),
        Text('3'),
        Text('4'),
        Text('5'),
        Text('6')
      ]),
      RaisedButton(
        child: Text("normal"),
        onPressed: () {
          Navigator.push(appContext, MaterialPageRoute(builder: (BuildContext context) => NewRoute(text: '参数',)));
        },
      ),
      Text('Forum'),
      Text('Person'),
    ];
  
  @override
  Widget build(BuildContext context) {    
    appContext = context;
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        initialIndex: 1,
        child: Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: <Widget>[
              AppBar(
                title: Text('Home'),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: onShowDialog,
                  ),
                ],
                bottom: TabBar(
                  isScrollable: true,
                  tabs: choices.map((Choice choice) {
                    return Tab(text: choice.title);
                  }).toList(),
                ),
              ),
              AppBar(title: Text('Map')),
              AppBar(title: Text('Forum')),
              AppBar(title: Text('Person'))
            ].elementAt(_selectedIndex),
            body: bodyWidgets.elementAt(_selectedIndex),
            drawer: DrawerSection(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: Icon(Icons.camera_alt),
              backgroundColor: Colors.blue,
            ),
            bottomNavigationBar: 
            // BottomAppBar(
            //   color: Colors.white,
            //   shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
            //   child: Row(
            //     children: [
            //       IconButton(
            //           icon: Icon(Icons.home),
            //           onPressed: () {
            //           }),
            //       SizedBox(), //中间位置空出
            //       IconButton(
            //           icon: Icon(Icons.business),
            //           onPressed: () {
            //           }),
            //     ],
            //     mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
            //   ),
            // )
              BottomNavigationBar(
                backgroundColor: Colors.blue,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.pets), title: Text('Home')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.map), title: Text('Map')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.forum), title: Text('Forum')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), title: Text('Person')),
                ],
                fixedColor: Colors.blue,
                selectedFontSize: 10.0,
                unselectedItemColor: Colors.grey,
                currentIndex: _selectedIndex,
                unselectedFontSize: 10.0,
                onTap: _onItemTapped,
              )
            ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class DrawerSection extends StatelessWidget {
  const DrawerSection({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
