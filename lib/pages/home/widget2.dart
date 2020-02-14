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

  List data;

  Future<dynamic> initData() async {
    Dio dio = Dio();
    final Response response = await dio.get("https://putian.ckudz.cn:8086/charge_stations?latitude=22.71991&longitude=114.24779&limit=20&page=1&attribute=01&name=");
    setState(() {
      data = response.data['data']['result'].toList();
    });
    print(response.data['data']);
  }

  @override
  void didUpdateWidget(Widget2 oldWidget) {       
    if(widget.tabIndex == 2) {
      initData();
    } 
    super.didUpdateWidget(oldWidget);   
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
