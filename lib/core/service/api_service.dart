import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8080/api';

  // Para produção, use o IP do servidor ou domínio
  // static const String baseUrl = 'https://sua-api.com/api';

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  static Future<Map<String, String>> getHeaders() async {
    final token = await getToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // Autenticação
  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signin'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await saveToken(data['token']);
      return data;
    } else {
      throw Exception('Falha no login');
    }
  }

  static Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
    String? phone,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha no cadastro');
    }
  }

  // Incidentes
  static Future<Map<String, dynamic>> createIncident({
    required String title,
    required String description,
    required double latitude,
    required double longitude,
    String? address,
    String? incidentType,
  }) async {
    final headers = await getHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/incidents'),
      headers: headers,
      body: jsonEncode({
        'title': title,
        'description': description,
        'latitude': latitude,
        'longitude': longitude,
        'address': address,
        'incidentType': incidentType,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao criar incidente');
    }
  }

  static Future<List<dynamic>> getMyIncidents() async {
    final headers = await getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/incidents/my'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar incidentes');
    }
  }

  static Future<List<dynamic>> getAllIncidents() async {
    final headers = await getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/incidents'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar incidentes');
    }
  }

  static Future<List<dynamic>> getIncidentsNear(
    double latitude,
    double longitude, {
    double radius = 0.01,
  }) async {
    final headers = await getHeaders();
    final response = await http.get(
      Uri.parse(
        '$baseUrl/incidents/near?latitude=$latitude&longitude=$longitude&radius=$radius',
      ),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar incidentes próximos');
    }
  }

  // Notificações
  static Future<List<dynamic>> getNotifications() async {
    final headers = await getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/notifications'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar notificações');
    }
  }

  static Future<Map<String, dynamic>> getUnreadCount() async {
    final headers = await getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/notifications/unread/count'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar contagem de notificações');
    }
  }

  static Future<void> markAsRead(int notificationId) async {
    final headers = await getHeaders();
    await http.put(
      Uri.parse('$baseUrl/notifications/$notificationId/read'),
      headers: headers,
    );
  }
}
