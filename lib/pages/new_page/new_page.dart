import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/provider/store.dart';

class NewRoute extends StatelessWidget {
  NewRoute({
    Key key,
    @required this.text, // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(text),
            Text('${context.watch<Counter>().count}'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 15),
              child: Text("返回上一页"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().increment();
              },
              child: Text("增量"),
            ),
          ],
        ),
      ),
    );
  }
}
