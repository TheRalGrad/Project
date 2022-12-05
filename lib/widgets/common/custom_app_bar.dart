import 'package:flutter/cupertino.dart';
import 'package:project/configs/themes/custom_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      this.title = '',
      this.showActionIcon = false,
      this.leading,
      this.titleWidget,
      this.onMenuActionTap})
      : super(key: key);
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Positioned.fill(
          child: titleWidget == null
              ? Center(
                  child: Text(
                    title,
                    style: appBarTS,
                  ),
                )
              : Center(child: titleWidget),
        )
      ],
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
