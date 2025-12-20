import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required int personCount,
    required this.onIncrement,
    required this.onDecrement,
  }) : _personCount = personCount;

  final int _personCount;
  final ThemeData theme;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Split", style: theme.textTheme.titleMedium),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: onDecrement,
              color: theme.colorScheme.primary,
            ),
            Text("$_personCount"),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: onIncrement,
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ],
    );
  }
}
