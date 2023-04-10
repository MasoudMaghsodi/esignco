// import 'dart:convert';

// import 'package:http/http.dart';

// import 'model.dart';

// class UserRepository {
//   String userUrl = 'https://reqres.in/api/users?page=2';

//   Future<List<Result>> getUsers() async {
//     Response response = await get(Uri.parse(userUrl));

//     if (response.statusCode == 200) {
//       final List result = jsonDecode(response.body)['data'];
//       return result.map((e) => Result.fromJson(e)).toList();
//     } else {
//       throw Exception(response.reasonPhrase);
//     }
//   }
// }
