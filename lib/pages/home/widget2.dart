import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Widget2 extends StatefulWidget {
  @override
  createState() => MyComponent();
}

class MyComponent extends State<Widget2> {

  String name = 'tony';

  List data = List();

  @override
  void initState() {    
    super.initState();
    initData();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      //打印滚动位置
      // if(_controller.position.pixels == _controller.position.maxScrollExtent){
      //   print(_controller.offset); 
      // }
    });
  }

  Future<void> _onRefresh() async {    
    initData();
    print('_onRefresh');
  }

   ScrollController _controller = new ScrollController();

  Future<dynamic> initData() async {
    Dio dio = Dio();
    final Response response = await dio.get(
        "http://rap2api.taobao.org/app/mock/225870/api/chat/list");
    setState(() {
      data.addAll(response.data['chat_list']);
    });
    print(data.length);
  }

  // @override
  // void didUpdateWidget(Widget2 oldWidget) {
  //   if (widget.tabIndex == 2) {
  //     initData();
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  Widget listNode() {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
    for (var item in data) {
      tiles.add(new Column(children: <Widget>[
        Image.network(
          item['image'],
          width: 500,
          height: 100,
          fit: BoxFit.cover,
        ),
        Text(item['name'])
      ]));
    }
    return Column(children: tiles);
  }

  // 构建列表
  Widget _itemBuilder(BuildContext context, int index) {
    return Row(children: <Widget>[
        Image.network(
          data[index]['imageUrl'],
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        Text('${data[index]['name']}$index' )
      ]);
  }

  // props 从 widget.xxx 获取
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
            itemCount: data.length,
            controller: _controller,
            itemExtent: 50, //强制高度为50.0
            itemBuilder: _itemBuilder
        )
      );
  }
}
