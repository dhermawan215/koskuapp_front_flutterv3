import 'dart:convert';

import 'package:Koskuappfront/models/models.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // String baseUrl = 'http://koskuapp.test/api';
  // String baseUrl = 'http://103.183.74.160/api';
  String baseUrl = 'http://www.koskuapp.web.id/api';

  Future<User> register({
    String? name,
    String? email,
    String? phone,
    String? password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    });

    var response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      User user = User.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('gagal registrasi');
    }
  }

  //login authservices

  Future<User> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      User user = User.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('gagal login');
    }
  }
}
