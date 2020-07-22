import 'package:flutter/material.dart';

class VideosWidget extends StatefulWidget {
  @override
  createState() => MyComponent();
}

class MyComponent extends State<VideosWidget> {
  @override
  void initState() {
    print('组件 initState');
    super.initState();
  }

  // props 从 widget.xxx 获取
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('videos'));
  }
}
