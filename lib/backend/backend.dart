import 'dart:convert';

import 'package:http/http.dart' as http;

class Backend {
  static String baseUrl = "http://localhost:3000";
  static String imageBaseUrl = "http://localhost:3000/images/";

  // json listát ad vissza (user, series)
  static Future<List<dynamic>> Get({required String route}) async {
    var response = await http.get(Uri.parse(baseUrl + route));
    return json.decode(response.body) as List<dynamic>;
  }

  // json listát ad vissza (login, reg)
  static Future<List<dynamic>> POST({required String route, required Map body}) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var response = await http.post(Uri.parse(baseUrl + route), body: jsonEncode(body), headers: headers);
    print(response.body);
    return json.decode(response.body) as List<dynamic>;
  }

  // üzenetet ad vissza (edit profile)
  static Future<String> PUT({required String route, required Map body}) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var response = await http.put(Uri.parse(baseUrl + route), body: jsonEncode(body), headers: headers);
    return json.decode(response.body) as String;
  }

  // kép elérését/nevét/ adja vissza (file upload)
  // body paramétere/kulcs/-->image
  static Future<String> FILE({required String route, required List<int> image}) async {
    var request = await http.MultipartRequest('PUT', Uri.parse(baseUrl + route))
      ..files.add(await http.MultipartFile.fromBytes('image', image, filename: 'image.jpg'));
    var response = await request.send();
    String json = await response.stream.bytesToString();
    return json.replaceAll("\"", ""); // "2023-02-12-image.jpg" --> 2023-02-12-image.jpg
  }
}
