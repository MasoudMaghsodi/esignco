import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

// class DioSevice {
//   Future<dynamic> getmethod() async {
//     final token = await http.get(
//         Uri.parse('https://ws.esignco.ir/api/v1/userManagement/user/login'));
//     Dio dio = new Dio();
//     dio.options.headers["Authorization"] = "Bearer $token";
//   }
// }

Future<http.Response> getMyData(String token) async {
  final headers = {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json'
  };
  final response = await http.get(
      Uri.parse('https://ws.esignco.ir/api/v1/userManagement/user/login'),
      headers: headers);
  return response;
}
