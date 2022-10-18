import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/services/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // SignUp({super.key});

  // @override
  // State<SignUp> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  String email = "";
  String password = "";
  String confirm = "";
  bool validPassword = false;

  void validateForm(String password, String confirm) {
    if (password.isNotEmpty && confirm.isNotEmpty && (password == confirm)) {
      validPassword = true;
    } else {
      validPassword = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                onChanged: (text) {
                  email = text;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                onChanged: (text) {
                  password = text;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                controller: confirmController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
                onChanged: (text) {
                  confirm = text;
                  validateForm(password, confirm);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                icon: const Icon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                  size: 20,
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(24),
                  // backgroundColor: Colors.blue,
                ),
                onPressed: validPassword
                    ? () {
                        print("Attempt signup");
                        Authentication().createAccount(email, password);
                        Navigator.pop(context);
                      }
                    : null,
                label: const Text('Sign Up', textAlign: TextAlign.center),
              ),
              const Spacer(),
            ]),
      ),
    );
  }
}
