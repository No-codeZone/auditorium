import 'package:flutter/cupertino.dart';

class AnimatedVisibility{
  static bool visible=true;
  static bool buttonPressed=false;

  // AnimatedVisibility({required this.visible});
}

/*
class AnimationCtrl with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  doAnimate(){
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }
}*/
