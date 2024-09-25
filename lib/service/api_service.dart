import 'package:http/http.dart' as http;

class ApiGetService {
  Future<String> getHolaMundo() async {
    final url = Uri.parse('TUAPI');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body; // Devuelve el cuerpo de la respuesta
    } else {
      throw Exception('Error al cargar datos');
    }
  }

  Future<String> getNombre(String nombre) async {
    // Construimos la URL correctamente con el parámetro de búsqueda 'nombre'
    String baseUrl = 'TUAPI';
    Uri url;

    // Si el nombre no está vacío, añadimos el parámetro
    if (nombre.isNotEmpty) {
      url = Uri.parse(
          '$baseUrl?nombre=${Uri.encodeComponent(nombre)}'); // encodeComponent para manejar caracteres especiales
    } else {
      url = Uri.parse(
          baseUrl); // Si el nombre está vacío, solicitamos todos los datosñ
    }

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body; // Devuelve el cuerpo de la respuesta
    } else {
      throw Exception('Error al cargar datos'); // Maneja errores
    }
  }
}
