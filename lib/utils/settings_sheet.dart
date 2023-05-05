import 'package:flutter/material.dart';
import 'package:taboo/utils/sheet.dart';

/*
  - BottomSheet that will be shown when @Settings button Clicked.
*/

class SettingSheet extends StatelessWidget {
  const SettingSheet({super.key});



  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return CustomSheet(
      childWidgets: [
        Text("Ayarlar"),
      ],
    );
  }
}
