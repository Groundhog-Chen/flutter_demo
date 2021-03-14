import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class StateWrap extends StatefulWidget {
  final bool visible;
  final Function onClose;
  StateWrap({this.visible, this.onClose});

  @override
  createState() => MyComponent();
}

class MyComponent extends State<StateWrap> {
  List data = [];

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<dynamic> initData() async {
    Dio dio = Dio();
    final Response response = await dio
        .get("http://rap2api.taobao.org/app/mock/225870/api/chat/list");
    setState(() {
      data.addAll(response.data['chat_list']);
    });
  }

  List<Widget> getData() {
    var tempList = data.map((item) {
      return Container(
        height: 120,
        // width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.black45),
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

  // props 从 widget.xxx 获取
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedPositioned(
        duration: Duration(milliseconds: 200),
        bottom: widget.visible ? 0 : -380,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.black26,
              width: width,
              height: 380.0,
              child: ListView(
                // controller: _scrollController,
                children: <Widget>[
                  Column(
                    children: getData(),
                  )
                ],
              ),
            ),
            Container(
              width: width,
              child: ButtonBar(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.close),
                    iconSize: 30,
                    color: Colors.white,
                    onPressed: widget.onClose,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
