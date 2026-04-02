import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static Future<Map<String, dynamic>> detectRust(String path) async {

    var request = http.MultipartRequest(
        "POST",
        Uri.parse("http://13.232.159.99:5000/predict")
    );

    request.files.add(  
        await http.MultipartFile.fromPath("image", path)
    );

    request.headers['Connection'] = 'close';

    var response = await http.Response.fromStream(await request.send());

    return jsonDecode(response.body);
  }
}