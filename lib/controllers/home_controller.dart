import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/models/team_data_model.dart';
import 'package:rive/rive.dart';

class HomeController extends GetxController {
  late RiveAnimationController carController;
  late RiveAnimationController flyingcarController;
  var isHovered = false.obs;
  var isHovered2 = 0.obs;
  var currentPointer = const Offset(0, 0);
  var center = const Offset(0, 0);
  var startAngle = 0.0.obs;
  var choosenTeam = 'A/V';
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
    onRotate.listen((p0) {});
  }

  void updateStartAngle(DragUpdateDetails details) {
    if (center.dx != 0 && center.dy != 0) {
      currentPointer -= center;
      var theta = details.delta.distance / currentPointer.distance;
      var updatedPointer = details.localPosition - center;
      var direction = currentPointer.dx * updatedPointer.dy -
          currentPointer.dy * updatedPointer.dx;
      if (direction > 0) {
        if (startAngle.value + theta > 2 * pi) {
          startAngle.value += theta - 2 * pi;
        } else {
          startAngle.value += theta;
        }
      } else if (direction < 0) {
        if (startAngle.value - theta < 0) {
          startAngle.value -= theta - 2 * pi;
        } else {
          startAngle.value -= theta;
        }
      }
      currentPointer += center + details.delta;
    }
  }

  void adjust() {
    int i = 1;
    for (i = 1; i <= 6; i++) {
      if (startAngle.value >= ((i - 1) / 6) * 360.0 * pi / 180.0) {
        if (startAngle.value <= (i / 6) * 360.0 * pi / 180.0) {
          moveWheel((i / 6) * 360.0 * pi / 180.0);
          break;
        }
      }
    }
  }

  void moveWheel(double finishAngle) {
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      startAngle.value += 0.01;
      if (startAngle > finishAngle) {
        timer.cancel();
        if (startAngle.value >= 2 * pi) {
          startAngle.value = 0;
        }
      }
    });
  }
}
