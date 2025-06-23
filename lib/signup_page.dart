import 'package:flutter/material.dart';
import 'package:to_do_list/app_routes.dart';
import 'package:to_do_list/form_data.dart';
import 'package:to_do_list/login_auth.dart';

class SignupPage extends StatefulWidget {

  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {


  final _formData = FormData();


    Future<void> submit(FormData formData) async {
        await LoginAuth().signup(
          formData.name,
          formData.email,
          formData.password,
        );
    }

    
  

  // ...existing code...
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white, // White background for the whole screen
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
                'Cadastro',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 0), 
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
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: Colors.white, 
                    border: OutlineInputBorder(
                    ),
                  ),
                ),
                SizedBox(height: 6),
                TextFormField(
                  key: Key('email'),
                  onChanged: (value) {
                    _formData.email = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 6),
                TextFormField(
                  key: Key('password'),
                  onChanged: (value) {
                    _formData.password = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => submit(_formData),
            child: Text('Sign up'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.login);
            },
            child: Text('Login'),
          ),
        ],
      ),
    ),
  );
}
}
