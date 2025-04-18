import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../utils/constants_manager.dart';


@lazySingleton
class NetworkService {
  Future<Map<String, dynamic>> fetchData(Uri url) async {
    final response = await http.get(url);

    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          "Failed to fetch data: ${response.statusCode} - ${response.body}");
    }
  }
  Future<int> post(List<int> features) async {
    try {
      print("Sending request to: ${AppConstants.aiModelBaseURL}");
      print("Request body: ${json.encode({'features': features})}");

      final response = await http.post(
        Uri.parse(AppConstants.aiModelBaseURL),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'features': features}),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.containsKey('prediction')) {
          return data['prediction'][0];
        } else {
          throw Exception("Response does not contain 'prediction' key");
        }
      } else {
        throw Exception("Failed to fetch prediction: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Exception: $e");
      throw Exception("Error in post: $e");
    }
  }

}



