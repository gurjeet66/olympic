import 'package:flutter/material.dart';

class Records extends StatefulWidget {
   Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Records"),
    );
  }
}