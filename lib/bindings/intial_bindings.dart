import 'package:get/get.dart';
import 'package:project/controllers/auth_controller.dart';

class IntialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }
}
