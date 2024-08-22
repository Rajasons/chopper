import 'dart:convert';
import 'dart:io';
import 'package:taxiuser/data/baseurl.dart';
import 'package:http/http.dart' as http;

class NetworkApi extends BaseUrl {
  @override
  Future<dynamic> getApi(
      {required String url, Map<String, String>? header}) async {
    var response;
    try {
      var responsejson = await http.get(Uri.parse(url),headers: header);
      response = jsonDecode(responsejson.body);
      print("${response}=====================================");
    } on SocketException {
      Map map = {
        "No_Internet": "No_Internet",
      };
      return map;
    } catch (e) {
      print("${response}=====================================");
    }

    return response;
  }

  @override
  Future postApi({required String url, dynamic body, Map<String, String>? header}) async {
    var response;
    try {
      var responsejson = await http.post(Uri.parse(url), body: body, headers: header);
      response = jsonDecode(responsejson.body);
      print("${response}=====================================");
      print("${responsejson.statusCode}=====================================");
    } on SocketException {
      Map map = {
        "No_Internet": "No_Internet",
      };
      return map;
    } catch (e) {
      print("${e}=====================================");
    }

    return response;
  }
}
