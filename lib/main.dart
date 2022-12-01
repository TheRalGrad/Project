import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/bindings/intial_bindings.dart';
import 'package:project/configs/themes/app_dark_theme.dart';
import 'package:project/configs/themes/app_light_theme.dart';
import 'package:project/controllers/theme_controller.dart';
import 'package:project/data_uploader_screen.dart';
import 'package:get/get.dart';
import 'package:project/routes/app_routes.dart';
import 'package:project/screen/introduction/introduction.dart';
import 'package:project/screen/splash/splash_screen.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  IntialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
    );
  }
}

/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(home: DataUploaderScreen()));
}*/