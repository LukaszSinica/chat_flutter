import 'dart:convert';

import 'package:chat/components/textinput.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final loginController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill,
              )
          ),
          padding: EdgeInsets.fromLTRB(12, 82, 12, 0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Create an Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                TextInput(visibilityOption: false, labelText: "Login", controller: loginController),
                SizedBox(height: 20), TextInput(visibilityOption: false, labelText: "Email", controller: emailController),
                SizedBox(height: 20),
                TextInput(visibilityOption: true, labelText: "Password", controller: passwordController),
                SizedBox(height: 20),
                TextInput(visibilityOption: true, labelText: "Confirm Password", controller: confirmPasswordController),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    var client = http.Client();

                    try {
                      var response = await client.post(
                        Uri.http('10.0.2.2:6060','user/createUser'),
                        body: {
                          'login': loginController.text,
                          'password': passwordController.text,
                          'repeatedPassword': confirmPasswordController.text,
                          'email': emailController.text,
                        });
                      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
                      var uri = Uri.parse(decodedResponse['uri'] as String);
                      print(await client.get(uri));
                    }
                    catch (e) {
                      print('error front');
                      print(e);
                    }
                    finally {
                      client.close();
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
