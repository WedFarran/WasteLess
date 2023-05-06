import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/styles.dart';
import '../bloc/filtering_change_notifier.dart';
import 'filtering_button_widget.dart';

class DriverFilteringOptionsWidget extends StatefulWidget {
  const DriverFilteringOptionsWidget({super.key});

  @override
  State<DriverFilteringOptionsWidget> createState() =>
      _DriverFilteringOptionsWidgetState();
}

class _DriverFilteringOptionsWidgetState
    extends State<DriverFilteringOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.28,
      margin: const EdgeInsets.only(top: 15, right: 20, bottom: 5, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    FILTRING_ICON,
                    height: context.height * 0.02,
                  ),
                  Text(
                    'Filter',
                    style: anyColorSize16(FONT_GRAY),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  context.read<FilteringChangeNotifier>().driversCheck = true;
                  context.read<FilteringChangeNotifier>().fullCheck = true;
                  context.read<FilteringChangeNotifier>().halfFullCheck = true;
                  context.read<FilteringChangeNotifier>().emptyCheck = true;
                },
                child: Text('Reset', style: anyColorSize16(BLACK)),
              ),
            ],
          ),
          Consumer<FilteringChangeNotifier>(
              builder: (context, fullSelected, child) {
            return FilteringButtonWidget(
              onTap: () => context.read<FilteringChangeNotifier>().fullCheck =
                  !fullSelected.fullCheck,
              selected: fullSelected.fullCheck,
              icon: Full_BIN_ICON,
              status: 'Full',
            );
          }),
          Consumer<FilteringChangeNotifier>(
              builder: (context, halfFullSelected, child) {
            return FilteringButtonWidget(
              onTap: () => context
                  .read<FilteringChangeNotifier>()
                  .halfFullCheck = !halfFullSelected.halfFullCheck,
              selected: halfFullSelected.halfFullCheck,
              icon: HALF_FULL_BIN_ICON,
              status: 'Half Full',
            );
          }),
          Consumer<FilteringChangeNotifier>(
              builder: (context, emptySelected, child) {
            return FilteringButtonWidget(
              onTap: () => context.read<FilteringChangeNotifier>().emptyCheck =
                  !emptySelected.emptyCheck,
              selected: emptySelected.emptyCheck,
              icon: EMPTY_BIN_ICON,
              status: 'Empty',
            );
          }),
        ],
      ),
    );
  }
}
