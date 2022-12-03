import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/common/background_decoration.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);
  static const String routeName = "/questionsscreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundDecoration(
        child: Text("I am here"),
      ),
    );
  }
}
