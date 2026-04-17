import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Authservice {
  final String baseUrl =
      'https://shoesphererailway-production.up.railway.app/api/v1';
  final storage = FlutterSecureStorage();

  Future<bool> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final AccessToken = data['access_token'];
        final bool is_verified=data['user']['is_verified'] ?? false;
        if (is_verified) {
          await storage.write(key: 'jwt_token', value: AccessToken);
          return true;
        }
      } else {
        print('login failed : ${response.body}');
        return false;
      }
    } catch (e) {
      print('error occured to railway server : $e');
      return false;
    }
    return false;
  }

  Future<bool> signup(
    String firstname,
    String lastname,
    String username,
    String email,
    String password,
  ) async {
    final url = Uri.parse('$baseUrl/auth/signup');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "first_name": firstname,
          "last_name": lastname,
          "username": username,
          "email": email,
          "password": password,
        }),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      } else {
        print('signup failed:${response.body}');
        return false;
      }
    } catch (e) {
      print('error during signup :$e');
      return false;
    }
  }

  Future<bool> requestPasswordReset(String email)async{
    final url=Uri.parse('$baseUrl/auth/password-reset-request');
    try{
      final response=await http.post(url,
      headers: {'Content-Type': 'application/json'},body: jsonEncode({'email':email}));
      if(response.statusCode==200 || response.statusCode==201){
          return true;
      }else{
        print('password reset resquest failed:${response.body}');
        return false;
      }
    }
    catch(e){
      print('errror occured during password reset request:$e');
      return false;
    }
  }
}
