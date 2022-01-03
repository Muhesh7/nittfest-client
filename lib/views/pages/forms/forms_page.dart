import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:nittfest/constants/break_points.dart';
import 'package:nittfest/controllers/inductions_controller.dart';
import 'package:nittfest/views/pages/forms/responsive/forms_page_desktop.dart';
import 'package:nittfest/views/pages/forms/responsive/forms_page_phone.dart';

class FormsPage extends GetResponsiveView<InductionsController> {
  FormsPage({Key? key})
      : super(key: key, settings: BreakPoints.getResponsiveScreenSettings());

  @override
  Widget? desktop() => const FormsPageDesktop();

  @override
  Widget? phone() => const FormsPagePhone();
}
