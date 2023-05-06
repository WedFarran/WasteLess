import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../utils/colors.dart';

class SettingsLoadingWidget extends StatelessWidget {
  const SettingsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.3,
      width: context.width,
      decoration: const BoxDecoration(
        color: PRIMARY_BLUE,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        height: context.height * 0.15,
        width: context.width,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            color: LIGHT_BLUE,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  color: BLACK.withOpacity(0.25),
                  blurRadius: 4)
            ]),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
