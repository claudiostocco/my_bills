import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../types/api_result.dart';
import '../../types/user_data.dart';

Future<ApiResult<UserData>> login(String user, String pass) async {
  var url = Uri.parse(kUrlapi + 'login/' + user + '/' + pass);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    jsonDecode(response.body);
    return Future(
      () => ApiResult(
        true,
        UserData(
          user,
          'Claudio',
          userImage: 'https://avatars.githubusercontent.com/u/47143084?v=4',
        ),
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
