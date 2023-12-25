import 'package:flutter/material.dart';

class CardScanner extends StatefulWidget {
  const CardScanner({super.key});

  @override
  State<CardScanner> createState() => _CardScannerState();
}

class _CardScannerState extends State<CardScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Scan your card',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
