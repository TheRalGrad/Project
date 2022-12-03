import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:project/configs/themes/app_colors.dart';
import 'package:project/configs/themes/app_icons.dart';
import 'package:project/configs/themes/custom_text_styles.dart';
import 'package:project/configs/themes/ui_parameters.dart';
import 'package:project/controllers/question_paper/question_paper_controller.dart';
import 'package:project/controllers/zoom_drawer_controller.dart';
import 'package:project/screen/home/menu_screen.dart';
import 'package:project/screen/home/question_card.dart';
import 'package:project/services/firebase_storage_service.dart';
import 'package:project/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:project/widgets/app_circle_button.dart';
import 'package:project/widgets/content_area.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    QuizPaperController quizPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_) {
        return ZoomDrawer(
          borderRadius: 50.0,
          controller: _.zoomDrawerController,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.defaultStyle,
          drawerShadowsBackgroundColor: Colors.white.withOpacity(0.5), // ***
          slideWidth: MediaQuery.of(context).size.width * 0.6,
          menuScreen: const MyMenuScreen(),
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(mobileScreenPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppCircleButton(
                        onTap: controller.toogleDrawer,
                        child: const Icon(
                          AppIcons.menuLeft,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const Icon(
                              AppIcons.peace,
                            ),
                            Text(
                              "Hello friend",
                              style: detailText.copyWith(
                                  color: onSurfaceTextColor),
                            )
                          ],
                        ),
                      ),
                      const Text(
                        "What do you want to learn today?",
                        style: headerText,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ContentArea(
                      addPadding: false,
                      child: Obx(() => ListView.separated(
                            padding: UIParameters.mobileScreenPadding,
                            itemCount: quizPaperController.allPapers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return QuestionCard(
                                model: quizPaperController.allPapers[index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                          )),
                    ),
                  ),
                )
              ],
            )),
          ),
        );
      }),
    );
  }
}
