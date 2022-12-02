import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/configs/themes/ui_parameters.dart';
import 'package:project/controllers/question_paper/question_paper_controller.dart';
import 'package:project/screen/home/question_card.dart';
import 'package:project/services/firebase_storage_service.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:project/widgets/content_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController quizPprController = Get.find();
    return Scaffold(
        body: ContentArea(
      child: Obx(() => ListView.separated(
            padding: UIParameters.mobileScreenPadding,
            itemCount: quizPprController.allPapers.length,
            itemBuilder: (BuildContext context, int index) {
              return QuestionCard(
                model: quizPprController.allPapers[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
          )),
    ));
  }
}
