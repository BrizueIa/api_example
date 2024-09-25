import 'package:flutter/material.dart';

import 'widgets/get_hola_mundo.dart';
import 'widgets/get_nombre.dart';

void main() {
  runApp(const MyApp());
}

//Garcia Hernandes, Arguelles Obregon, Morales Urrutia, Vicente Bautista, Rocha Coronada, Rosales Perales, Antonio Guzman

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: const Center(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                GetHolaMundo(),
                GetNombre(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
