// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class FilteringButtonWidget extends StatefulWidget {
  final bool selected;
  final void Function()? onTap;
  final String icon;
  final String status;

  const FilteringButtonWidget({
    super.key,
    required this.selected,
    required this.onTap,
    required this.icon,
    required this.status,
  });

  @override
  State<FilteringButtonWidget> createState() => _FilteringButtonWidgetState();
}

class _FilteringButtonWidgetState extends State<FilteringButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        color: widget.selected == true ? BUTTON_FOCUS_COLOR : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.icon,
                  height: context.height * 0.055,
                ),
                Text(
                  widget.status,
                  style: anyColorSize16(BLACK),
                )
              ],
            ),
            Visibility(
                visible: widget.selected == true ? true : false,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    CHECK_ICON,
                    height: context.height * 0.018,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
