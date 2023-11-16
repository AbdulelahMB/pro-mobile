import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = "";

Future<Map<String, dynamic>> sendMessage(String message) async {
  final url = 'https://api.openai.com/v1/chat/completions';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  final body = jsonEncode({
    'model': "gpt-3.5-turbo",
    'messages': [
      {
        "role": "system",
        "content": "You are a helpful Doctor that give advices to Patients."
      },
      {
        "role": "system",
        "content":
            'answer the following question, refuse if the question is not health or medical related: "$message"'
      }
    ],
    'max_tokens': 4000,
    'n': 1,
    'stop': null,
    'temperature': 0.7,
  });

  final response =
      await http.post(Uri.parse(url), headers: headers, body: body);

  if (response.statusCode != 200) {
    throw Exception('Failed to send message: ${response.body}');
  }

  final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
  return jsonResponse['choices'][0];
}
