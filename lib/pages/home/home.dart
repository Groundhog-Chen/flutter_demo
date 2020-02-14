import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../new_page/new_page.dart';
import 'widget1.dart';
import 'widget2.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  int _selectedIndex = 2;
  var _ipAddress = 'Unknown';

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

  void _callback(int val) {
    if (val != null) {
      setState(() {
        _counter = val;
      });
    }
    print(val);
  }

  _askedToLead() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(        
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'search',
            onPressed: () {
              return showDialog<Null>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Rewind and remember'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('You will never be satisfied.'),
                          Text('You\’re like me. I’m never satisfied.'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Regret'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Offstage(
              offstage: _selectedIndex != 0,
              child: StateWrap(
                title: '$_ipAddress',
                onPress: _askedToLead(),
              ),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: Column(children: <Widget>[
                Text(
                  '_counters:$_counter',
                ),
                FlatButton(
                  child: Text("open new route"),
                  textColor: Colors.blue,
                  onPressed: () async {
                    //导航到新路由
                    var res = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NewRoute(text: '参数 text');
                    }));
                    _callback(res);
                  },
                ),
              ]),
            ),
            Offstage(
              offstage: _selectedIndex != 2,
              child: Widget2(
                title: '组件2',
                tabIndex: _selectedIndex,
              ),
            ),
            // Offstage(
            //     offstage: _selectedIndex != 2,
            //     child: ListView.builder(
            //         itemCount: 100,
            //         itemExtent: 50.0, //强制高度为50.0
            //         itemBuilder: (BuildContext context, int index) {
            //           return ListTile(title: Text("$index"));
            //         })
            //   ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: DefaultTabController(
  //       length: choices.length,
  //       child: Scaffold(
  //           appBar: AppBar(
  //             title: const Text('Tabbed AppBar'),
  //             bottom: TabBar(
  //               isScrollable: true,
  //               tabs: choices.map((Choice choice) {
  //                 return Tab(
  //                   text: choice.title,
  //                   icon: Icon(choice.icon),
  //                 );
  //               }).toList(),
  //             ),
  //           ),
  //           body: TabBarView(
  //             children: choices.map((Choice choice) {
  //               return Padding(
  //                 padding: const EdgeInsets.all(16.0),
  //                 child: ChoiceCard(choice: choice),
  //               );
  //             }).toList(),
  //           ),
  //           bottomNavigationBar: BottomNavigationBar(
  //             items: <BottomNavigationBarItem>[
  //               BottomNavigationBarItem(
  //                   icon: Icon(Icons.home), title: Text('Home')),
  //               BottomNavigationBarItem(
  //                   icon: Icon(Icons.business), title: Text('Business')),
  //               BottomNavigationBarItem(
  //                   icon: Icon(Icons.school), title: Text('School')),
  //             ],
  //             currentIndex: _selectedIndex,
  //             fixedColor: Colors.blue,
  //             onTap: _onItemTapped,
  //           )),
  //     ),
  //   );
  // }
}

// class Choice {
//   const Choice({this.title, this.icon});
//   final String title;
//   final IconData icon;
// }

// const List<Choice> choices = const <Choice>[
//   const Choice(title: 'CAR', icon: Icons.directions_car),
//   const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
//   const Choice(title: 'BOAT', icon: Icons.directions_boat),
//   const Choice(title: 'BUS', icon: Icons.directions_bus),
//   const Choice(title: 'TRAIN', icon: Icons.directions_railway),
//   const Choice(title: 'WALK', icon: Icons.directions_walk),
// ];

// class ChoiceCard extends StatelessWidget {
//   const ChoiceCard({Key key, this.choice}) : super(key: key);

//   final Choice choice;

//   @override
//   Widget build(BuildContext context) {
//     final TextStyle textStyle = Theme.of(context).textTheme.display1;
//     return Card(
//       color: Colors.white,
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Icon(choice.icon, size: 128.0, color: textStyle.color),
//             Text(choice.title, style: textStyle),
//           ],
//         ),
//       ),
//     );
//   }
// }
