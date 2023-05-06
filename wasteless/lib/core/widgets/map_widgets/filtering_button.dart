import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../features/driver features/map/presentation/widgets/driver_filtering_options_widget.dart';
import '../../utils/assets_path.dart';
import '../../utils/colors.dart';

class FilteringButton extends StatelessWidget {
  const FilteringButton({super.key});

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
          builder: (context) => const DriverFilteringOptionsWidget()),
    );
  }
}
