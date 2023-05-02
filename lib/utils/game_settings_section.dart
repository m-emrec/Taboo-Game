import 'package:flutter/material.dart';

class GameSettings extends StatelessWidget {
  const GameSettings({super.key});

  // Oyun Süresi | Pas hakkı | Tur Sayısı

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SettingSlider(
          minMalue: 60,
          maxValue: 180,
          value: 60,
          title: "Oyun Süresi",
          division: 4,
        ),
        SettingSlider(
          title: "Tur Sayısı",
          minMalue: 2,
          maxValue: 10,
          value: 4,
          division: 4,
        ),
        SettingSlider(
          maxValue: 5,
          value: 3,
          title: "Pas Hakkı",
          division: 5,
        ),
        // Start game button
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Başla"),
            ),
          ),
        )
      ],
    );
  }
}

class SettingSlider extends StatefulWidget {
  SettingSlider({
    super.key,
    required this.value,
    required this.title,
    required this.maxValue,
    required this.division,
    this.minMalue = 0,
  });

  double value;
  final double maxValue;
  final String title;
  final int division;
  final double minMalue;
  @override
  State<SettingSlider> createState() => _SettingSliderState();
}

class _SettingSliderState extends State<SettingSlider> {
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
