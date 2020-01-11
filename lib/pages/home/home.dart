import 'package:flutter/material.dart';
import '../new_page/new_page.dart';
import 'widget1.dart';

import 'package:dio/dio.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  int _selectedIndex = 1;
  var _ipAddress = 'Unknown';

  Future<dynamic> _getIPAddress() async {
    Dio dio = Dio();
    final Response response =
        await dio.get("https://weapp.ckudz.cn/charge_station/1");
    print(response.data);
  }

  @override
  void initState() {
    _getIPAddress();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      print(_counter);
    });
  }

  void _callback(int val) {
    if (val != null) {
      setState(() {
        _counter = val;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Offstage(
              offstage: _selectedIndex != 0,
              child: StateWrap(
                title: '$_ipAddress'
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
            // Offstage(
            //     offstage: _selectedIndex != 2,
            //     child: ListView.builder(
            //         itemCount: 100,
            //         itemExtent: 50.0, //强制高度为50.0
            //         itemBuilder: (BuildContext context, int index) {
            //           return ListTile(title: Text("$index"));
            //         })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
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
}
