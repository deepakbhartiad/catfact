import 'dart:convert';
import '../model/model.dart';
import 'package:http/http.dart' as http;
class APIs{

 static Future<factModel> catFactApi() async {
    var response = await http.get(Uri.parse("https://catfact.ninja/fact"));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      factModel model = factModel.fromJson(jsonData); // Parse JSON to factModel object
      print("Fact: ${model.fact}");
      return model;
    } else {
      throw Exception("Error occurred");
    }
  }
}