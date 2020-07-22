import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../player/player.dart';

class ListWidget extends StatefulWidget {
  @override
  createState() => MyComponent();
}

class MyComponent extends State<ListWidget> {
  String name = 'tony';

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
        margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0.0,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Image.network(
                  "http://via.placeholder.com/150x150",
                  fit: BoxFit.fill,
                ),
                title: Text('${item['name']}'),
                subtitle:
                    Text(item['message'], overflow: TextOverflow.ellipsis),
                isThreeLine: true,
              )
            ],
          ),
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
            Container(
              height: 150.0,
              child: new Swiper(
                onTap: (i) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => PlayerPage()));
                },
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    "http://via.placeholder.com/350x150",
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: 3,
                pagination: new SwiperPagination(),
                // control: new SwiperControl(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30,
                            child: Text('A'),
                            backgroundColor: Colors.grey[200],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('BTN',
                                style: TextStyle(color: Colors.grey)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30,
                            child: Text('A'),
                            backgroundColor: Colors.grey[200],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('BTN',
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30,
                            child: Text('A'),
                            backgroundColor: Colors.grey[200],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('BTN',
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30,
                            child: Text('A'),
                            backgroundColor: Colors.grey[200],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('BTN',
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            Column(
              children: getData(),
            )
          ],
        ));
  }
}
