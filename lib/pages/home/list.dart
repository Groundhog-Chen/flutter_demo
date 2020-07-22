import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ListPage extends StatefulWidget {
  @override
  createState() => MyComponent();
}

class MyComponent extends State<ListPage> {
  List data = List();

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    initData();
    //监听滚动事件，打印滚动位置
    _scrollController.addListener(() {
      //打印滚动位置
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        initData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    setState(() {
      data = List();
    });
    initData();
    print('_onRefresh');
  }

  Future<dynamic> initData() async {
    Dio dio = Dio();
    final Response response = await dio
        .get("http://rap2api.taobao.org/app/mock/225870/api/chat/list");
    setState(() {
      data.addAll(response.data['chat_list']);
    });
    print(data.length);
  }

  List<Widget> getData() {
    var tempList = data.map((item) {
      return Container(
        height: 120,
        // width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('http://via.placeholder.com/375x120'),
            fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${item['name']}',
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
            Text(
              '${item['name']}',
              style: TextStyle(fontSize: 14.0, color: Colors.white),
            )
          ],
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView(
          controller: _scrollController,
          children: <Widget>[
            Column(
              children: getData(),
            )
          ],
        ));
  }
}
