import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/configs/themes/app_colors.dart';
import 'package:project/configs/themes/app_icons.dart';
import 'package:project/configs/themes/custom_text_styles.dart';
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
    QuizPaperController quizPprController = Get.find();
    return Container(
//      decoration: BoxDecoration(gradient: mainGradient()),
      color: Colors.blueAccent,
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(mobileScreenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(AppIcons.menuLeft, color: Colors.red),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(AppIcons.menuLeft, color: Colors.red),
                    Text(
                      "Hello friend",
                      style: detailText.copyWith(color: onSurfaceTextColor),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ContentArea(
              addPadding: false,
              child: Obx(() => ListView.separated(
                    padding: UIParameters.mobileScreenPadding,
                    itemCount: quizPprController.allPapers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return QuestionCard(
                        model: quizPprController.allPapers[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                  )),
            ),
          )
        ],
      )),
    );
  }
}
