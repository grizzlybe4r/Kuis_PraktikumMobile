// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, unused_element, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kuis_prakmobile/homepage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = true;
  bool visible = true;

  _navigatePage() async {
    await Future.delayed(Duration(seconds: 2));

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(
        username: username,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Column(
          children: [
            Image.asset('assets/images/upnLogo.png'),
            _usernameField(),
            _passwordField(),
            _loginButton(context)
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        enabled: true,
        decoration: InputDecoration(
          labelText: 'Username',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value;
        },
        obscureText: visible,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
            icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
          ),
          labelText: 'Password',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: () {
            String text = '';
            if (username == 'jibran' && password == 'jago123') {
              _navigatePage();
              setState(() {
                text = 'Login Berhasil';
                isLoginSuccess = true;
              });
            } else {
              setState(() {
                text = 'Login Gagal';
                isLoginSuccess = false;
              });
            }

            SnackBar snackBar = SnackBar(
                backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
                content: Text(text),
                duration: Duration(seconds: 3));

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text(
            'Login',
            selectionColor: Colors.blue,
          )),
    );
  }
}
