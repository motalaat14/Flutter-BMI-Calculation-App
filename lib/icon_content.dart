import 'package:flutter/material.dart';

import 'constants.dart';



class iconContent extends StatelessWidget {
  final IconData iconType;
  final String lable;

  iconContent({@required this.iconType, this.lable});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconType,
          size: 80,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          lable,
          style: klableTextStyle
        )
      ],
    );
  }
}
