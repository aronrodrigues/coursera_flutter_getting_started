import 'package:flutter/material.dart';
import 'package:utip/widgets/bill_amount_field.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_slider.dart';
import 'package:utip/widgets/total_per_person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.amber)),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCount = 1;
  double _tipPct = 20;
  double _billAmount = 0;
  double _tipValue = 0;

  void calculateTipValue() {
    _tipValue = (_billAmount * (_tipPct / 100));
  }

  void increment() {
    setState(() {
      _personCount++;
      calculateTipValue();
    });
  }

  void decrement() {
    if (_personCount > 1) {
      setState(() {
        _personCount--;
        calculateTipValue();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("UTip App"),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(
            theme: theme,
            billAmount: _billAmount,
            tipValue: _tipValue,
            personCount: _personCount,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: theme.colorScheme.primary, width: 2),
            ),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                BillAmountField(
                  onChanged: (value) {
                    setState(() {
                      _billAmount = double.tryParse(value) ?? 0.0;
                      calculateTipValue();
                    });
                  },
                ),
                PersonCounter(
                  theme: theme,
                  personCount: _personCount,
                  onDecrement: decrement,
                  onIncrement: increment,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tip", style: theme.textTheme.titleMedium),
                    Text(
                      "\$${_tipValue.toStringAsFixed(2)}",
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
                // == Slider Text
                Text("$_tipPct%"),
                TipSlider(
                  tipPct: _tipPct,
                  onChanged: (double value) {
                    setState(() {
                      _tipPct = value;
                      calculateTipValue();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
