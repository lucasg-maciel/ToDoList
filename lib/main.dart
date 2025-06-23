import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_list/app_routes.dart';
import 'package:to_do_list/login_page.dart';
import 'package:to_do_list/signup_page.dart';
import 'package:to_do_list/tarefas_page.dart';
import 'firebase_options.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.login: (context) => LoginPage(),
        AppRoutes.cadastro: (context) => SignupPage(),
        AppRoutes.tarefas: (context) => TarefasPage(),
      },

    );
  }
  
}

