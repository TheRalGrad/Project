import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);
  static const String routeName = "/resultscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Result here"),
      ),
    );
  }
}
