import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../utils/assets_path.dart';
import '../utils/colors.dart';

class LogoBackButton extends StatelessWidget {
  const LogoBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: PRIMARY_GREEN,
              )),
          Image.asset(
            WASTELESS_LOGO_TRANS,
            height: context.height * 0.15,
          )
        ],
      ),
    );
  }
}
