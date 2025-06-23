import 'dart:math';

class Tarefa {
  final String id;
  final String text;
  final DateTime createdAt;



  const Tarefa({
    required this.id,
    required this.text,
    required this.createdAt,

  });

  factory Tarefa.create(String text) {
    return Tarefa(
      id: Random().nextDouble().toString(), 
      text: text,
      createdAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      id: map['id'] ?? '',
      text: map['text'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
