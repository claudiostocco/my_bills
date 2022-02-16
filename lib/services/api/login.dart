import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../types/user_data.dart';

class ApiResult<T> {
  ApiResult(this.success, this.data);
  bool success;
  T data;
}

Future<ApiResult> login(String user, String pass) async {
  var url = Uri.parse(kUrlapi + 'login/' + user + '/' + pass);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return Future(
      () => ApiResult<String>(
        true,
        jsonDecode(response.body),
      ),
    );
  } else {
    return Future(
      () => ApiResult(false, null),
    );
  }
  // return Future(
  //   () => UserData(
  //     'claudiostocco@gmail.com',
  //     'Claudio Marcio Stocco',
  //     userImage: 'https://avatars.githubusercontent.com/u/47143084?v=4',
  //   ),
  // );
}
