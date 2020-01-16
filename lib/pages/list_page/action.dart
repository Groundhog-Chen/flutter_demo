import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/pages/list_page/state.dart';
import '../../model/mock/model.dart';

enum ListAction { action, initList, updata }

class ListActionCreator {
  static Action updataAction(ListState value) {
    return Action(
      ListAction.updata,
      payload: value
    );
  }
  static Action onAction() {
    return const Action(ListAction.action);
  }

  static Action initListAction(List<MockItemModel> items) {
    return Action(ListAction.initList, payload: items);
  }

}
