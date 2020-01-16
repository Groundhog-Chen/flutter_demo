import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

// import 'action.dart';
import 'state.dart';

Widget buildView(ListState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter adapter = viewService.buildAdapter();     //创建adapter

  return Scaffold(
      appBar: new AppBar(
        title: new Text('List page'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: adapter.itemBuilder, //把adapter配置到list
          itemCount: adapter.itemCount,     //
        ),
      ));
}
