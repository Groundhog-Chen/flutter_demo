import 'package:fish_redux/fish_redux.dart';

import '../../model/mock/model.dart';
import 'action.dart';
import 'state.dart';

Reducer<ListState> buildReducer() {
  return asReducer(
    <Object, Reducer<ListState>>{
      ListAction.action: _onAction,
      // ListAction.initList: _onInitList,
      ListAction.updata: _updata
    },
  );
}

ListState _updata(ListState state, Action action) {
  ListState newState = state.clone();
  final ListState updataState = action.payload;
  newState = updataState;
  return newState;
}
ListState _onAction(ListState state, Action action) {
  final ListState newState = state.clone();
  return newState;
}

// ListState _onInitList(ListState state, Action action) {
//   final List<MockItemModel> data = action.payload ?? <MockItemModel>[];
//   final ListState newState = state.clone();
//   newState.items = data;
//   return newState;
// }
