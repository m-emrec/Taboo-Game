import 'package:flutter/material.dart';

// I use this extension to make it easier to write image paths
extension ImagePath on String {
  String get toPng => "assets/images/$this.png";
}

// I use this extension to create spacing.
extension EmptyPadding on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
}

extension CustomDivider on num {
  Divider get th => Divider(
        thickness: toDouble(),
      );
}

// extension CustomPadding on num{

//   EdgeInsets get pad => EdgeInsets.all(toDouble());

// }
