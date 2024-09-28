import 'package:flutter/material.dart';

class Medaltracker extends StatefulWidget {
  const Medaltracker({super.key});

  @override
  State<Medaltracker> createState() => _MedaltrackerState();
}

class _MedaltrackerState extends State<Medaltracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("MedalTracker")),
    );
  }
}