import 'package:project/controllers/question_paper/questions_controller.dart';
import 'package:project/controllers/question_paper_controller.dart';
import 'package:project/controllers/zoom_drawer_controller.dart';
import 'package:project/screen/home/home_screen.dart';
import 'package:project/screen/introduction/introduction.dart';
import 'package:project/screen/login/login_screen.dart';
import 'package:project/screen/question/questions_screen.dart';
import 'package:project/screen/question/test_overview_screen.dart';
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
              Get.put(MyZoomDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
        GetPage(
            name: QuestionsScreen.routeName,
            page: () => QuestionsScreen(),
            binding: BindingsBuilder(() {
              Get.put<QuestionsController>(QuestionsController());
            })),
        GetPage(
            name: TestOverviewScreen.routeName,
            page: () => const TestOverviewScreen())
      ];
}
