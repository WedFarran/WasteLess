import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../features/admin features/map/presentation/widgets/filtering_options_widget.dart';
import '../../utils/assets_path.dart';
import '../../utils/colors.dart';

class FilteringButton extends StatelessWidget {
  const FilteringButton({
    super.key,
  });

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
            builder: (context) => const FilteringOptionsWidget()),
      ),
    );
  }
}
