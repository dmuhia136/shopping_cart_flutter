import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DbBase {
  var postRequestType = "POST";
  var getRequestType = "GET";
  var patchRequestType = "PUT";
  var deleteRequestType = "DELETE";

  databaseRequest(String link, String type,
      {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("access_token");

      if (headers == null) {
        headers = {
          'Content-Type': 'application/json',
          'Authorization': "Bearer " + (token ?? "")
        };
      }

      var request = http.Request(type, Uri.parse(link));

      if (body != null) {
        request.body = json.encode(body);
      }

      request.headers.addAll(headers);

      print(request.toString());
      print(body.toString());

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 404) {
        print("Error 404");
      }

      return response.stream.bytesToString();
    } catch (e, s) {
      print("Error on api $link $e $s");
    }
  }
}