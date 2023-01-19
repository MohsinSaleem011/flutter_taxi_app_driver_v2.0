import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../theme/style.dart';

class StepsPartView extends StatelessWidget {
  final String instructions;
  final String duration;
  final String imageManeuver;

  const StepsPartView(
      {Key? key,
        required this.instructions,
        required this.duration,
        required this.imageManeuver
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image.asset(imageManeuver,width: 20.0),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Html(
                  data: """ ${instructions.trim()} """,
                 // style: textStyle,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5.0,bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Text(duration ,style: textStyle,)
                        ),
                        const Expanded(
                          flex: 4,
                          child: Divider(color: greyColor2,),
                        )
                      ],
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
