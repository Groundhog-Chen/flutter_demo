import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/provider/store.dart';

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
    return Text(
      'count：${context.watch<Counter>().count}',
      key: const Key('counterState'),
    );
  }
}
