import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../types/api_result.dart';
import '../../types/bills_data.dart';

Future<ApiResult<List<BillsData>>> getBills(String? id) async {
  //var url = Uri.parse(kUrlapi + 'login/' + user + '/' + pass);
  Uri url;
  if (id == null || id.isEmpty) {
    url = Uri.parse(kUrlapi + '/my-manager/my-bills.json');
  } else {
    url = Uri.parse(kUrlapi + '/my-manager/my-bills/' + id + '.json');
  }

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);

    print(jsonResponse);

    List<BillsData> listResponse = List.empty(growable: true);
    (jsonResponse as Map).forEach((key, value) {
      print(key + '=' + value);
    });
    // List<BillsData> listResponse = List.empty(growable: true);
    // listResponse.add(const BillsData(
    //   '',
    //   'descrition',
    //   'whereSpend',
    //   false,
    //   56.12,
    // ));

    // for (var c in jsonResponse) {
    // print(c);
    // }

    // BillsData(
    //   '',
    //   jsonResponse['descrition'],
    //   jsonResponse['whereSpend'],
    //   jsonResponse['paid'],
    //   jsonResponse['amount'],
    // ),

    return Future(
      () => ApiResult(
        true,
        listResponse,
      ),
    );
  } else {
    return Future(
      () => ApiResult(false, null),
    );
  }
}
