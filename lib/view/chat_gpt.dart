import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> sendMessage(String question) async {
  final String endpoint =
      "https://csc489mobile.cognitiveservices.azure.com"; // Replace with your actual endpoint
  final String projectName = "mobile"; // Replace with your actual project name
  final String deploymentName =
      "production"; // Replace with your actual deployment name
  final String url =
      "$endpoint/language/:query-knowledgebases?projectName=$projectName&deploymentName=$deploymentName&api-version=2021-10-01";
  final String subscriptionKey = "1f171529785141ee82ded9e3437254a3";

  final Map<String, dynamic> data = {
    "top": 3,
    "question": question,
    "includeUnstructuredSources": true,
    "answerSpanRequest": {"enable": true}
  };

  final http.Response response = await http.post(
    Uri.parse(url),
    headers: {
      "Ocp-Apim-Subscription-Key": subscriptionKey,
      "Content-Type": "application/json"
    },
    body: jsonEncode(data),
  );
  print(url);
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    if (jsonResponse.containsKey('answers') &&
        jsonResponse['answers'].isNotEmpty) {
      // return jsonResponse['answers'][0]['answer'];
      return jsonResponse['answers'][0]['answerSpan']['text'];
    } else {
      throw Exception('No answer found');
    }
  } else {
    throw Exception('Failed to load response');
  }
}
