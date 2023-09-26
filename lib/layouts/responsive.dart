import 'package:flutter/material.dart';

class Responsive extends StatefulWidget {
  const Responsive({super.key});

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: currentWidth < 600 ? Colors.blue : Colors.amber,
      body: Center(child: Text(currentWidth.toString())),
    );
  }
}
