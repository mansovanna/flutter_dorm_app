import 'package:dio/dio.dart';
import 'package:final_dromitory/app/constants/constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  // Define your API methods here
  // user Dio to talk with api
  final _dio = Dio(
    BaseOptions(
      baseUrl: kBaseUrl,
      contentType: 'application/json',
      responseType: ResponseType.json,
      connectTimeout: Duration(seconds: 1000),
      receiveTimeout: Duration(seconds: 1000),
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );

  Future<Response> login({
    required String studentId,
    required String password,
  }) async {
    try {
      final data = {'student_id': studentId, 'password': password};

      return await _dio.post('/login.php', data: data); // ← JSON request
    } catch (e) {
      rethrow;
    }
  }

  // get profile data
  Future<Response> getProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token')?.trim() ?? '';

      if (token.isEmpty) {
        throw Exception('No token found');
      }

      return await _dio.get(
        '/profile.php',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );
    } catch (e) {
      print('Error getting profile: $e');
      rethrow;
    }
  }

  // -----------------------------------------

  Future<Response> getHistoryLeave({String status = "", int id = 0}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token')?.trim() ?? '';
      print("This app ${status}");

      if (token.isEmpty) {
        throw Exception('No token found');
      }

      return await _dio.get(
        '/hist-law.php?status=$status&id=$id',
        queryParameters: {'status': status, 'id': id},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );
    } catch (e) {
      print('Error getting profile: $e');
      rethrow;
    }
  }

  Future<Response> postLeave({required Object data}) async {
    //

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token')?.trim() ?? '';

      if (token.isEmpty) {
        throw Exception('No token found');
      }

      return await _dio.post(
        '/requst-law.php',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
        data: data,
      );
    } catch (e) {
      print('Error getting profile: $e');
      rethrow;
    }
  }

  // logouts
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
