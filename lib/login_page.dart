import 'package:flutter/material.dart';
import 'package:to_do_list/app_routes.dart';
import 'package:to_do_list/form_data.dart';
import 'package:to_do_list/signup_page.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final _formData = FormData();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Container(
                padding: EdgeInsets.all(5.0),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(

                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8),
              ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
            TextFormField(
              key: Key('username'),
              onChanged: (value) {
                _formData.name = value;
              },
              decoration:  InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
            ),
            ),
            SizedBox(height: 10),
            TextFormField(
              key: Key('password'),
              onChanged: (value) {
                _formData.password = value;
              },
              decoration:  InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              
            ),
                ]
              )
            ),
            TextButton(
              onPressed: () {
              },
              child:  Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.cadastro);
              },
              child: Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}