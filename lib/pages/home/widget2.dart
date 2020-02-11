import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Widget2 extends StatefulWidget {
  final String title;
  final Function onPress;
  final int tabIndex;
  Widget2({this.title, this.onPress, this.tabIndex});
  
  @override
  createState() => MyComponent();
}

class MyComponent extends State<Widget2> {

  String name = 'tony';

  Future<dynamic> initData() async {
    Dio dio = Dio();
    final Response response = await dio.get("https://weapp.ckudz.cn/charge_station/1");
    setState(() {
      name = response.data['data']['name'];
    });
  }

  @override
  void initState() {
    
    super.initState();
  }

  @override
  void deactivate() {
    print('组件2 deactivate');
    super.deactivate();
  }

  @override
  void didUpdateWidget(Widget2 oldWidget) {       
    if(widget.tabIndex == 2 && name != '深圳志达工业园充电站') {
      print("didUpdateWidget");
      print(widget.tabIndex);
      initData();
    } 
    super.didUpdateWidget(oldWidget);   
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();      
  }

  // props 从 widget.xxx 获取
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(widget.title + name),
          FlatButton(child: const Text('Press'), onPressed: widget.onPress),
        ],
      ),
    );
  }
}
