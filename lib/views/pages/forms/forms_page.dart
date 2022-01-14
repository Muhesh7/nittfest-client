import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:nittfest/constants/break_points.dart';
import 'package:nittfest/controllers/home_controller.dart';
import 'package:nittfest/views/pages/forms/responsive/forms_page_desktop.dart';
import 'package:nittfest/views/pages/forms/responsive/forms_page_phone.dart';

class FormsPage extends GetView<HomeController> {
  const FormsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ImageProvider bg = const AssetImage('assets/bg1.webp');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(image: bg, fit: BoxFit.fill)),
          child: Stack(children: [
            Opacity(
                opacity: 0.35,
                child: WeatherBg(
                  width: size.width,
                  height: size.height,
                  weatherType: WeatherType.cloudyNight,
                )),
            Container(
              width: size.width,
              height: size.height,
              color: Colors.black54,
            ),
            FormsPageResponsive(),
          ])),
    );
  }
}

class FormsPageResponsive extends GetResponsiveView<HomeController> {
  FormsPageResponsive({Key? key})
      : super(key: key, settings: BreakPoints.getResponsiveScreenSettings());
  @override
  Widget? desktop() => const FormsPageDesktop();

  @override
  Widget? phone() => const FormsPagePhone();
}
