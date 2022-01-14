import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/models/team_data_model.dart';
import 'package:rive/rive.dart';

class HomeController extends GetxController {
  late RiveAnimationController carController;
  late RiveAnimationController flyingcarController;
  var isHovered = false.obs;
  var isHovered2 = 0.obs;
  Stream<int> onRotate = const Stream.empty();
  ImageProvider bg = const AssetImage('bg1.png');
  List<TeamDataModel> data = [
    TeamDataModel(name: 'OC', color: Colors.red),
    TeamDataModel(name: 'EVENTS', color: Colors.blue),
    TeamDataModel(name: 'CONTENT', color: Colors.blueGrey),
    TeamDataModel(name: 'DESIGN', color: Colors.green),
    TeamDataModel(name: 'A/V', color: Colors.indigo),
    TeamDataModel(name: 'AMBIENCE', color: Colors.purple),
  ];
  void togglePlay() => carController.isActive = !carController.isActive;

  @override
  void onInit() {
    carController = SimpleAnimation('driwing');
    flyingcarController = SimpleAnimation('Animation');
    super.onInit();
    onRotate.listen((p0) {
      log(p0.toString());
    });
  }

//   _panUpdateHandler(DragUpdateDetails d) {
//     /// Pan location on the wheel
//     bool onTop = d.localPosition.dy <= radius;
//     bool onLeftSide = d.localPosition.dx <= radius;
//     bool onRightSide = !onLeftSide;
//     bool onBottom = !onTop;

//     /// Pan movements
//     bool panUp = d.delta.dy <= 0.0;
//     bool panLeft = d.delta.dx <= 0.0;
//     bool panRight = !panLeft;
//     bool panDown = !panUp;

//     /// Absolute change on axis
//     double yChange = d.delta.dy.abs();
//     double xChange = d.delta.dx.abs();

//     /// Directional change on wheel
//     double verticalRotation = (onRightSide && panDown) || (onLeftSide && panUp)
//         ? yChange
//         : yChange * -1;

//     double horizontalRotation =
//         (onTop && panRight) || (onBottom && panLeft) ? xChange : xChange * -1;

// // Total computed change
//     double rotationalChange = verticalRotation + horizontalRotation;

//     double _value = degree + (rotationalChange / 5);

//     setState(() {
//       degree = _value > 0 ? _value : 0;
//       ctrl.value = degree;
//     });
//   }

//   _panEndHandler(DragEndDetails d) {
//     ctrl
//         .animateTo(roundToBase(degree.roundToDouble(), 10),
//             duration: Duration(milliseconds: 551), curve: Curves.easeOutBack)
//         .whenComplete(() {
//       setState(() {
//         degree = roundToBase(degree.roundToDouble(), 10);
//       });
//     });
//   }
}
