import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/controllers/question_paper/question_paper_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project/services/firebase_storage_service.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
        body: Obx(() => ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                  child: SizedBox(
                      height: 200,
                      width: 200,
                      child: FadeInImage(
                        image: NetworkImage(
                            _questionPaperController.allPaperImages[index]),
                        placeholder:
                            AssetImage("assets/images/app_splash_logo.png"),
                      )));
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
            itemCount: _questionPaperController.allPaperImages.length)));
  }
}
