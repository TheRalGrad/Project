import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/controllers/question_paper/questions_controller.dart';
import 'package:project/widgets/common/background_decoration.dart';
import 'package:get/get.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({Key? key}) : super(key: key);
  static const String routeName = "/questionsscreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: BackgroundDecoration(
      child: Center(child: Text("I am here")),
    ));
  }
}
