import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ListWidget extends StatefulWidget {
  @override
  createState() => MyComponent();
}

class MyComponent extends State<ListWidget> {
  String name = 'tony';

  List data = List();

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

  ScrollController _scrollController = new ScrollController();

  Future<dynamic> initData() async {
    Dio dio = Dio();
    final Response response = await dio
        .get("http://rap2api.taobao.org/app/mock/225870/api/chat/list");
    setState(() {
      data.addAll(response.data['chat_list']);
      // data = response.data['chat_list'];
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

  // 构建列表
  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: ListTile(
        leading: Image(
          width: 64.0,
          height: 64.0,
          image: NetworkImage(data[index]['imageUrl']),
        ),
        title: Text(
          '${data[index]['name']}'
        ),
        subtitle: Text(
          data[index]['message'],
          overflow: TextOverflow.ellipsis
        ),
        trailing: Icon(Icons.more_vert, color: Colors.blue,),
        isThreeLine: true,
      ),
    );
  }

  // props 从 widget.xxx 获取
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
            itemCount: data.length,
            controller: _scrollController,
            itemBuilder: _itemBuilder));
  }
}
