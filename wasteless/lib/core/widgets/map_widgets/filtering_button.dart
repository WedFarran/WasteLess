import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../features/driver features/map/presentation/widgets/filtering_options_widget.dart';
import '../../utils/assets_path.dart';
import '../../utils/colors.dart';

class FilteringButton extends StatelessWidget {
  final Function()? fullOnTap;
  final Function()? halfFullOnTap;
  final Function()? emptyOnTap;
  final Function()? resetOnTap;
  final bool halfFullSelected;
  final bool emptySelected;
  final bool fullSelected;
  const FilteringButton(
      {super.key,
        required this.emptyOnTap,
        required this.fullOnTap,
        required this.halfFullOnTap,
        required this.resetOnTap,
        required this.emptySelected,
        required this.fullSelected,
        required this.halfFullSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80.0),
      child: FloatingActionButton(
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
            builder: (context) => FilteringOptionsWidget(
              fullSelected: fullSelected,
              halfFullSelected: halfFullSelected,
              emptySelected: emptySelected,
              emptyOnTap: emptyOnTap,
              fullOnTap: fullOnTap,
              halfFullOnTap: halfFullOnTap,
            )),
      ),
    );
  }
}
