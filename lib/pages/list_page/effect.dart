import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';
import '../../model/mock/model.dart';

Effect<ListState> buildEffect() {
  return combineEffects(<Object, Effect<ListState>>{
    ListAction.action: _onAction,
    // Lifecycle.initState: _onInitData
  });
}

void _onAction(Action action, Context<ListState> ctx) {
}

// void _onInitData(Action action, Context<ListState> ctx) {
//   List<MockItemModel> mockData = [
//     MockItemModel(type: 0, title: '标题1', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题2', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题3', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题4', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题5', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题6', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题7', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题8', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题9', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题10', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题11', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题12', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题13', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题14', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题15', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题16', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题17', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题18', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题19', content: '这里是内容'),
//     MockItemModel(type: 0, title: '标题20', content: '这里是内容')
//   ];
//   ctx.dispatch(ListActionCreator.initList(mockData));
// }
