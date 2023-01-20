import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  var url = Uri.http('10.0.2.2:6060');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // runApp(const MyApp());
}
