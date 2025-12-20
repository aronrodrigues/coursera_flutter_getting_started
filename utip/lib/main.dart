import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utip/widgets/person_counter.dart';

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

  void increment() {
    setState(() {
      _personCount++;
    });
  }

  void decrement() {
    if (_personCount > 1) {
      setState(() {
        _personCount--;
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
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  "Tip per person",
                  style: theme.textTheme.titleSmall!.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                Text(
                  "\$20.83",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
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
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.attach_money),
                    labelText: "Bill amount",
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                  onChanged: (String value) {
                    print(value);
                  },
                ),
                PersonCounter(
                  theme: theme,
                  personCount: _personCount,
                  onDecrement: decrement,
                  onIncrement: increment,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
