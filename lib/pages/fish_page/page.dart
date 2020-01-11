import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FishPage extends Page<FishState, Map<String, dynamic>> {
  FishPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<FishState>(
                adapter: null,
                slots: <String, Dependent<FishState>>{
                }),
            middleware: <Middleware<FishState>>[
            ],);

}
