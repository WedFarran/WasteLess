import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(color: LIGHT_BLUE),
        ),
      ),
    );
  }
}
