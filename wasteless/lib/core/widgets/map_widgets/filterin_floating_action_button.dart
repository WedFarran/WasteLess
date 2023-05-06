import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../utils/assets_path.dart';
import '../../utils/colors.dart';

class FilterinFloatingActionButton extends StatelessWidget {
  final Widget widget;
  const FilterinFloatingActionButton({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: WHITE,
      child: Image.asset(
        FILTRING_ICON,
        height: context.height * 0.04,
      ),
      onPressed: () => showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
          backgroundColor: WHITE,
          context: context,
          builder: (context) => widget),
    );
  }
}
