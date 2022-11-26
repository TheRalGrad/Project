import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/configs/themes/app_colors.dart';
import 'package:project/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: mainGradient(context)),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, size: 65, color: Colors.amber),
                  SizedBox(height: 40),
                  const Text('This is a Project II app. I try to get good app'),
                  SizedBox(
                    height: 40,
                  ),
                  AppCircleButton(
                      onTap: () => null,
                      child: const Icon(Icons.arrow_forward, size: 35))
                ],
              ),
            )));
  }
}
