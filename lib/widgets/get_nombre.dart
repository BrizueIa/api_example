import 'package:flutter/material.dart';
import '../service/api_service.dart';

class GetNombre extends StatefulWidget {
  const GetNombre({super.key});

  @override
  _GetNombre createState() => _GetNombre();
}

class _GetNombre extends State<GetNombre> {
  final ApiGetService apiService = ApiGetService();
  String data = '';
  String nombre = '';
  final TextEditingController _nombreController =
      TextEditingController(); // Controlador de texto

  Future<void> _getNombre(String nombre) async {
    try {
      final result =
          await apiService.getNombre(nombre); // Pasamos el nombre a la API
      setState(() {
        data = result; // Actualizamos el estado con el resultado
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
          const SizedBox(height: 20),
          const Divider(),
          TextField(
            controller:
                _nombreController, // Usamos el controlador para obtener el texto
            decoration: const InputDecoration(
              labelText: 'Nombre',
            ),
            onChanged: (value) {
              setState(() {
                nombre = value; // Actualizamos el nombre cuando cambia el texto
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              _getNombre(
                  nombre); // Llamamos a _getNombre cuando se presiona el botón
            },
            child: const Text('Obtener nombre'),
          ),
          const SizedBox(height: 20),
          Text(data), // Mostramos el resultado de la API
        ],
      ),
    );
  }
}
