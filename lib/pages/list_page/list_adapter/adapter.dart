import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import '../item_component/component.dart';
import 'reducer.dart';

class ItemAdapter extends SourceFlowAdapter<ListState> {
  ItemAdapter()
      : super(
          pool: <String, Component<Object>>{
            'item': ItemComponent(),
          },
          reducer: buildReducer(),
        );
}
