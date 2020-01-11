import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;  

import 'action.dart';
import 'state.dart';

Effect<FishState> buildEffect() {
  return combineEffects(<Object, Effect<FishState>>{
    FishAction.action: _onAction,
    FishAction.openGrid: _onOpenGrid, 
  });
}

void _onAction(Action action, Context<FishState> ctx) {
}

void _onOpenGrid(Action action, Context<FishState> ctx) {
  Navigator.of(ctx.context).pushNamed('grid_page', arguments: null); 
}
