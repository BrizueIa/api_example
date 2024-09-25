import 'package:flutter/material.dart';

import '../service/api_service.dart';

class GetHolaMundo extends StatefulWidget {
  const GetHolaMundo({super.key});

  @override
  _GetHolaMundo createState() => _GetHolaMundo();
}

class _GetHolaMundo extends State<GetHolaMundo> {
  final ApiGetService apiService = ApiGetService();
  String data = '';

  void _getHolaMundo() async {
    try {
      final result = await apiService.getHolaMundo();
      setState(() {
        data = result;
      });
    } catch (e) {
      setState(() {
        data = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _getHolaMundo,
            child: const Text('Pulsa para obtener Hola Mundo'),
          ),
          const SizedBox(height: 20),
          Text(data),
        ],
      ),
    );
  }
}
