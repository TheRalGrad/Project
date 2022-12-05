import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/screen/home/question_card.dart';
import 'package:project/widgets/common/background_decoration.dart';
import 'package:project/widgets/common/custom_app_bar.dart';
import 'package:get/get.dart';

class TestOverviewScreen extends GetView<QuestionCard> {
  const TestOverviewScreen({Key? key}) : super(key: key);
  static const String routeName = "/testoverview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "Test over",
      ),
      body: BackgroundDecoration(
        child: Center(child: Text("Test ")),
      ),
    );
  }
}
