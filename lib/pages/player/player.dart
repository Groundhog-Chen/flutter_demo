import 'dart:ui';
import 'package:flutter/material.dart';
import 'bottom_widget.dart';

// ignore: must_be_immutable
class PlayerPage extends StatefulWidget {
  PlayerPage({Key key}) : super(key: key);
  @override
  createState() => MyComponent();
}

class MyComponent extends State<PlayerPage>
    with SingleTickerProviderStateMixin {
  double _sliderValue = 0;
  bool _visible = false;
  bool isPlay = false;
  AnimationController _animationController;
  Animation _animation;
  void _onClose() {
    print('close');
    setState(() {
      _visible = false;
    });
  }

  void onChangePlay() {
    setState(() {
      isPlay = !isPlay;
    });
    print(isPlay);
    if (isPlay == true) {
      _animationController.forward();
    } else {
      _animationController.stop();
    }
  }

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(seconds: 10), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
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
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/timg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Center(
              child: Container(
                color: Colors.red.withOpacity(0),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: width,
              child: AppBar(
                  iconTheme: IconThemeData(color: Colors.white),
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  title: Text(
                    '喵~~~',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
          RotationTransition(
            turns: _animation,
            child: Container(
              height: 320,
              width: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white24,
                  width: 6,
                ),
                image: DecorationImage(
                  image: AssetImage('images/timg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Container(
          //   decoration:
          //       BoxDecoration(shape: BoxShape.circle, color: Colors.white24),
          //   child: IconButton(
          //     color: Colors.white,
          //     icon: Icon(Icons.play_arrow),
          //     onPressed: () {},
          //   ),
          // ),
          Positioned(
            bottom: 130,
            child: Center(
              child: Container(
                width: 320,
                child: Slider(
                  inactiveColor: Colors.grey,
                  activeColor: Colors.white,
                  value: _sliderValue,
                  onChanged: (v) {
                    this.setState(() {
                      _sliderValue = v;
                    });
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            width: width,
            child: Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.loop),
                    onPressed: () {},
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.skip_previous),
                    onPressed: () {},
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white24),
                    child: IconButton(
                      color: Colors.white,
                      iconSize: 32.0,
                      padding: EdgeInsets.all(10.0),
                      icon: isPlay ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                      onPressed: onChangePlay,
                    ),
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.skip_next),
                    onPressed: () {},
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      setState(() {
                        _visible = true;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          StateWrap(
            visible: _visible,
            onClose: _onClose,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
