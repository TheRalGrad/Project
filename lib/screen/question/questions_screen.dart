import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/themes/custom_text_styles.dart';
import 'package:project/controllers/question_paper/questions_controller.dart';
import 'package:project/firebase_ref/loading_status.dart';
import 'package:project/widgets/common/background_decoration.dart';
import 'package:get/get.dart';
import 'package:project/widgets/common/question_place_holder.dart';
import 'package:project/widgets/content_area.dart';
import 'package:project/widgets/questions/answer_card.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({Key? key}) : super(key: key);
  static const String routeName = "/questionsscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundDecoration(
      child: Obx(() => Column(
            children: [
              if (controller.loadingStatus.value == LoadingStatus.loading)
                const Expanded(
                    child: ContentArea(child: QuestionScreenHolder())),
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                    child: ContentArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          controller.currentQuestion.value!.question,
                          style: questionTS,
                        ),
                        GetBuilder<QuestionsController>(builder: (context) {
                          return ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                final answer = controller
                                    .currentQuestion.value!.answers[index];

                                return AnswerCard(
                                    answer:
                                        '${answer.identifier}. ${answer.answer}',
                                    onTap: () {
                                      controller
                                          .selectedAnswer(answer.identifier);
                                    });
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                        height: 10,
                                      ),
                              itemCount: controller
                                  .currentQuestion.value!.answers.length);
                        })
                      ],
                    ),
                  ),
                ))
            ],
          )),
    ));
  }
}
