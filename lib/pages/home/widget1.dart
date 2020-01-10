import 'package:flutter/material.dart';

class StateWrap extends StatefulWidget {
  
    final String title;
    final Function onPress;
    StateWrap({this.title, this.onPress});

    @override
    createState() => MyComponent();
}

class MyComponent extends State<StateWrap> {
    // props 从 widget.xxx 获取
    @override
    Widget build(BuildContext context) {
      return Center(
          child: Column(
              children: <Widget>[
                  Text(widget.title),
                  FlatButton(child: const Text('Press'), onPressed: widget.onPress),
              ],
          ),
      );
    }
}