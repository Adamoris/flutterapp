import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/services/auth.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FlutterLogo(
              size: 150,
            ),
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
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                )),
            Flexible(
              child: ElevatedButton.icon(
                icon: const Icon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                  size: 20,
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(24),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () => Authentication().emailLogin(email, password),
                label: const Text('Sign In', textAlign: TextAlign.center),
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  'New User? Sign up!',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )),
            Flexible(
              child: LoginButton(
                icon: FontAwesomeIcons.question,
                text: 'Continue as Guest',
                loginMethod: Authentication().anonLogin,
                color: Colors.deepPurple,
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// WIP: Use this widget for apple and google logins down the line
class LoginButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final Function loginMethod;

  const LoginButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.color,
      required this.loginMethod});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: color,
        ),
        onPressed: () => loginMethod(),
        label: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
