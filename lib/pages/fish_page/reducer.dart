import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FishState> buildReducer() {
  return asReducer(
    <Object, Reducer<FishState>>{
      FishAction.action: _onAction,
    },
  );
}

FishState _onAction(FishState state, Action action) {
  final FishState newState = state.clone();
  return newState;
}
