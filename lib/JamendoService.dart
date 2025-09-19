import 'dart:convert';
import 'package:http/http.dart' as http;

class JamendoService {
  final String clientID = 'b570cd03';
  final String baseUrl = 'https://api.jamendo.com/v3.0/tracks/?client_id=b570cd03&format=json';

  Future<List<dynamic>> findPopularTracks({int limit = 7}) async {
    final url = Uri.parse('${baseUrl}pretty&order=popularity_total_desc&limit=$limit');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results'] ?? [];
    } else {
      throw Exception('Failed to load tracks');
    }
  }

  Future<List<dynamic>> findTrack(String name) async {
    final url = Uri.parse('${baseUrl}pretty&limit=7&name=$name');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results'] ?? [];
    } else {
      throw Exception('Track not found');
    }
  }

}
