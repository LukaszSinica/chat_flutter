import 'package:chat/components/textinput.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
                TextInput(visibilityOption: false, labelText: "Login"),
                SizedBox(height: 20),
                TextInput(visibilityOption: false, labelText: "Email"),
                SizedBox(height: 20),
                TextInput(visibilityOption: true, labelText: "Password"),
                SizedBox(height: 20),
                TextInput(visibilityOption: true, labelText: "Confirm Password"),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {},
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
