import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/language.dart';
import '../../../../../core/utils/styles.dart';

class HistoryButtonWidget extends StatelessWidget {
  final Function()? onTap;
  const HistoryButtonWidget({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.height * 0.05,
        width: context.width * 0.4,
        decoration: BoxDecoration(
            color: PRIMARY_BLUE,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: BLACK.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4))
            ]),
        alignment: Alignment.center,
        child: Text(
          translations(context).history,
          style: anyColorSize16(WHITE),
        ),
      ),
    );
  }
}
