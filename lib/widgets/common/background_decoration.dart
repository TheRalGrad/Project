import 'package:flutter/cupertino.dart';

class BackgroundDecoration extends StatelessWidget {
  final Widget child;
  final bool showGradient;
  const BackgroundDecoration(
      {Key? key, required this.child, this.showGradient = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [],
    );
  }
}
