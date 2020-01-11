import 'package:fish_redux/fish_redux.dart';

enum FishAction { action, openGrid }

class FishActionCreator {

  static Action onAction() {
    return const Action(FishAction.action);
  }

  static Action onOpenGrid() {
    return const Action(FishAction.openGrid);
  }
}
