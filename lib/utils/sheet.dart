import 'dart:ui';

import 'package:flutter/material.dart';

/*
  - I use this widget for ModalBottomSheet. 
*/

class CustomSheet extends StatelessWidget {
  const CustomSheet({super.key, required this.childWidgets});

  final List<Widget>? childWidgets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Theme.of(context).canvasColor,
                Theme.of(context).canvasColor.withOpacity(0.9),
                Theme.of(context).canvasColor.withOpacity(0.8),
                Theme.of(context).canvasColor.withOpacity(0.7),
                Theme.of(context).canvasColor.withOpacity(0.6),
                Theme.of(context).canvasColor.withOpacity(0.5),
                Theme.of(context).canvasColor.withOpacity(0.4),
                Theme.of(context).canvasColor.withOpacity(0.0),
              ],
            ),
          ),
          child: Column(
            children: childWidgets??[],
          ),
        ),
      ),
    );
  }
}
