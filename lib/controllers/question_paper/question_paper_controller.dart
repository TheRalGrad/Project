import 'package:project/controllers/auth_controller.dart';
import 'package:project/models/question_paper_model.dart';
import 'package:get/get.dart';
import 'package:project/services/firebase_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/firebase_ref/references.dart';
import 'package:project/utils/app_logger.dart';

class QuizPaperController extends GetxController {
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  Future<void> getAllPapers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();

      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imageUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imageUrl;
        print(imageUrl);
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        //Get.offNamed()
      } else {
        print("logged in");
        //Get.toNamed();
      }
    } else {
      print('The title is ${paper.title}');
      _authController.showLoginAlertDialogue();
    }
  }
}
