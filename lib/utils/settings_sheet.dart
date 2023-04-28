
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingSheet extends StatelessWidget {
  const SettingSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height:screenHeight*0.5 ,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,

          colors: [
            Theme.of(context).cardColor,
            Theme.of(context).cardColor.withOpacity(0.9),
            Theme.of(context).cardColor.withOpacity(0.8),
            Theme.of(context).cardColor.withOpacity(0.7),
            Theme.of(context).cardColor.withOpacity(0.6),
            Theme.of(context).cardColor.withOpacity(0.5),
            Theme.of(context).cardColor.withOpacity(0),
          ]
        )
      ),
      child: Column(
        children: [
          Text("asda"),
        ],
      ),
    );
  }
}