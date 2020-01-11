import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<GridState> buildEffect() {
  return combineEffects(<Object, Effect<GridState>>{
    GridAction.action: _onAction,
    Lifecycle.initState: _init,
  });
}

void _onAction(Action action, Context<GridState> ctx) {
}
void _init(Action action, Context<GridState> ctx) {
  ctx.dispatch(GridActionCreator.onLoadData());
}
