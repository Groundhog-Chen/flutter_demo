import 'package:flutter/material.dart';
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

  int _selectedIndex = 0;
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

  _askedToLead() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          /*
          下面是一个弹出菜单按钮，包含两个属性点击属性和弹出菜单子项的建立
          其中<String>是表示这个弹出菜单的value内容是String类型
           */
          PopupMenuButton<String>(
              //这是点击弹出菜单的操作，点击对应菜单后，改变屏幕中间文本状态，将点击的菜单值赋予屏幕中间文本
              onSelected: (String value) {
                print(value);
                setState(() {
                  _ipAddress = value;
                });
              },
              //这是弹出菜单的建立，包含了两个子项，分别是增加和删除以及他们对应的值
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('增加'),
                          Icon(Icons.add_circle)
                        ],
                      ),
                      value: '这是增加',
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('删除'),
                          Icon(Icons.remove_circle)
                        ],
                      ),
                      value: '这是删除',
                    )
                  ])
        ]
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
}
