import 'package:flutter/material.dart';

class TotalPerPerson extends StatelessWidget {
  const TotalPerPerson({
    super.key,
    required this.theme,
    required double billAmount,
    required double tipValue,
    required int personCount,
  }) : _billAmount = billAmount,
       _tipValue = tipValue,
       _personCount = personCount;

  final ThemeData theme;
  final double _billAmount;
  final double _tipValue;
  final int _personCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            "Total per person",
            style: theme.textTheme.titleSmall!.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
          Text(
            "\$${((_billAmount + _tipValue) / _personCount).toStringAsFixed(2)}",
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
