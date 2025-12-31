import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BillAmountField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const BillAmountField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.attach_money),
        labelText: "Bill amount",
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      onChanged: onChanged,
    );
  }
}
