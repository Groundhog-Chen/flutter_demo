import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimationDemo extends StatefulWidget {
  Widget chlid;

  AnimationDemo({@required this.chlid});

  @override
  State<StatefulWidget> createState() => _AnimationDemo();
}

class _AnimationDemo extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(seconds: 10), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    //开始动画
    _animationController.forward();
    super.initState();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        print("status is completed");
        //重置起点
        _animationController.reset();
        //开启
        _animationController.forward();
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
        print("status is dismissed");
      } else if (status == AnimationStatus.forward) {
        print("status is forward");
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
        print("status is reverse");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: widget.chlid,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
