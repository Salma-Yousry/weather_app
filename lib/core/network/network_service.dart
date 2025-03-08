import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkService {
  Future<Map<String, dynamic>> fetchData(Uri url) async {
    final response = await http.get(url);

    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to fetch data: ${response.statusCode} - ${response.body}");
    }
  }
}
