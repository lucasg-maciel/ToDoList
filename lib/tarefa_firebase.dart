import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_list/tarefa.dart';

class TarefaFirebase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Tarefa>> getTasks() {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return Stream.value([]);

    return _firestore.collection('users').doc(userId).collection('tasks').orderBy('createdAt', descending: true).snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Tarefa.fromMap(doc.data()))
          .toList();
    });
  }

  Future<void> addTask(String text) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null || text.trim().isEmpty) return;

    final task = Tarefa.create(text);
    print('Saving task for user: $userId');
    await _firestore.collection('users').doc(userId).collection('tasks').doc(task.id).set(task.toMap());
    print('Task saved successfully');
  }

}