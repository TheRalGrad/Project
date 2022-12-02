import 'package:project/controllers/question_paper/question_paper_controller.dart';
import 'package:project/screen/home/home_screen.dart';
import 'package:project/screen/introduction/introduction.dart';
import 'package:project/screen/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
          name: "/introduction",
          page: () => const AppIntroductionScreen(),
        ),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuizPaperController());
            })),
      ];
}
