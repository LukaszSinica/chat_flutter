import 'package:chat/register.dart';
import 'package:flutter/material.dart';
import 'package:chat/components/textinput.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
        padding: EdgeInsets.fromLTRB(12, 122, 12, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.chat,
              color: Colors.blue,
              size: 72,
            ),
            SizedBox(height: 20),
            TextInput(visibilityOption: false, labelText: "Login"),
            SizedBox(height: 20),
            TextInput(visibilityOption: true, labelText: "Password"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 18
                ),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
            SizedBox(height: 68),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have account yet?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Register()),
                      );
                    },
                    child: Text('Register')
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
