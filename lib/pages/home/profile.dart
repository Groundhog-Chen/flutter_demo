import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  @override
  createState() => MyComponent();
}

class MyComponent extends State<ProfileWidget> {
  @override
  void initState() {
    print('组件 initState');
    super.initState();
  }

  // props 从 widget.xxx 获取
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('profile'));
  }
}
