import 'package:fish_redux/fish_redux.dart';

class FishState implements Cloneable<FishState> {

  @override
  FishState clone() {
    return FishState();
  }
}

FishState initState(Map<String, dynamic> args) {
  return FishState();
}
