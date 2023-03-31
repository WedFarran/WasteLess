import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';

class BinDetailsWidget extends StatelessWidget {
  const BinDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height * 0.30,
        margin: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: context.width * 0.35,
                  height: context.height * 0.15,
                  decoration: BoxDecoration(
                      color: CIRCLE.withOpacity(0.33),
                      borderRadius: BorderRadius.circular(60)),
                  child: const Text(
                    '50%',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: FONT_GRAY),
                  ),
                ),
                const Text(
                  'half',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: FONT_GRAY),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 100.0),
                  child: Text(
                    'location:',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: FONT_GRAY),
                  ),
                ),
                Text(
                  'Abdullah ',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: PRIMARY_BLUE),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  'full expected time:',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: FONT_GRAY),
                ),
                Text(
                  '100% in 1 Hour',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: PRIMARY_BLUE),
                )
              ],
            )
          ],
        ) /* Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('50'),
              Text(
                'location:',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: FONT_GRAY),
              ),
              Text(
                'full expected time',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: FONT_GRAY),
              )
            ],
          ),
          SizedBox(
            width: context.width * 0.1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'half',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: FONT_GRAY),
              ),
              Text(
                'Abdullah ',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: PRIMARY_BLUE),
              ),
              Text(
                '100% in 1 Hour',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: PRIMARY_BLUE),
              )
            ],
          )
        ],
      ),*/
        );
  }
}
