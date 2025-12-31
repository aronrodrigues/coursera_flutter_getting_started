import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({super.key, required double tipPct, required this.onChanged})
    : _tipPct = tipPct;

  final ValueChanged<double> onChanged;
  final double _tipPct;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _tipPct,
      divisions: 6,
      max: 35,
      min: 5,
      label: "$_tipPct%",
      onChanged: onChanged,
    );
  }
}
