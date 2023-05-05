import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  CustomSlider({
    super.key,
    required this.value,
    required this.title,
    required this.maxValue,
    required this.division,
    this.minMalue = 0,
    required this.func,
  });

  double value;
  final double maxValue;
  final String title;
  final int division;
  final double minMalue;
  final Function func;
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Title of slider
          Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          //Slider
          Slider(
            onChangeEnd: (value) => widget.func(value.toInt()),
            value: widget.value,
            onChanged: (newValue) => setState(
              () {
                widget.value = newValue;
              },
            ),
            max: widget.maxValue,
            min: widget.minMalue,
            divisions: widget.division,
            label: "${widget.value}",
          ),
          // Value text
          Text(
            widget.value.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
