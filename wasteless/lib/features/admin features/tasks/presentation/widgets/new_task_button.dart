import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/language.dart';
import '../../../../../core/utils/styles.dart';

class NewTaskButton extends StatelessWidget {
  final Function()? onTap;
  const NewTaskButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: context.height * 0.05,
          width: context.width * 0.35,
          decoration: BoxDecoration(
              color: PRIMARY_BLUE,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: BLACK.withOpacity(0.25))
              ]),
          alignment: Alignment.center,
          child: Text(
            translations(context).add_task,
            style: anyColorSize16(WHITE),
          ),
        ),
      ),
    );
  }
}
