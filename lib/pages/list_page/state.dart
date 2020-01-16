import 'package:fish_redux/fish_redux.dart';
import './item_component/state.dart';

class ListState extends MutableSource implements Cloneable<ListState> {
  ListState({this.items});

  List<ItemState> items; 

  @override
  ListState clone() {
    return ListState()
    ..items = items;
  }

  @override
  Object getItemData(int index) {
    return null;
  }

  @override
  String getItemType(int index) {
    return null;
  }

  @override
  int get itemCount => null;

  @override
  void setItemData(int index, Object data) {
  }
}

ListState initState(Map<String, dynamic> args) {
  return ListState()..items =
    [
      ItemState(type: 1, title: 'test1', content: 'content'),
      ItemState(type: 2, title: 'test2', content: 'content'),
      ItemState(type: 3, title: 'test3', content: 'content'),
     
    ];
}
