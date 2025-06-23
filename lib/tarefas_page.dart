import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/app_routes.dart';

class TarefasPage extends StatelessWidget {
  const TarefasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((_) {
                Navigator.of(context).pushReplacementNamed(AppRoutes.login);
              });
            },
          ),
        ],
        title: Text('Tarefas'),
      ),
      body: Center(
        child: Text('Lista de Tarefas'),
      ),
    );
  }
}