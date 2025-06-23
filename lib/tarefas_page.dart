import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/app_routes.dart';
import 'package:to_do_list/tarefa.dart';
import 'package:to_do_list/tarefa_firebase.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({Key? key}) : super(key: key);

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  final _tarefaFirebase = TarefaFirebase();
  String _message = '';
  final _messageController = TextEditingController();

  Future<void> addTask() async {

  await TarefaFirebase().addTask(_messageController.text);
  _messageController.clear();

  }



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
      body: Column(
        children: [
            Expanded(
                child: StreamBuilder<List<Tarefa>>(
                  stream: _tarefaFirebase.getTasks(),
                  builder: (context, snapshot) {
                    final tasks = snapshot.data ?? [];
          
                    if (tasks.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.task_alt,
                              size: 64,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No tasks yet!',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'Add your first task above',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return Card(
                          margin: EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: Icon(
                              Icons.task_alt,
                              color: Colors.purple,
                            ),
                            title: Text(task.text),
                            subtitle: Text(
                              'Created: ${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year}',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                onChanged: (msg) => setState(() => _message = msg),
                decoration: InputDecoration(
                  labelText: 'Nova tarefa',
                ),
                onSubmitted: (_) {
                  if (_message.trim().isNotEmpty) {
                    addTask();
                  }
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                if (_message.trim().isNotEmpty) {
                  addTask();
                }
              },
            ),
          ],
          ),
            ],
      ),
    );
  }
}