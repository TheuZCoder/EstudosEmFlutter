class Todolist {
  //atributos
  final String id;
  final String titulo;
  final String userId;
  final DateTime timestamp;

  Todolist({required this.id, required this.titulo, required this.userId, required this.timestamp});

  // toMap
  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'userid': userId,
      'timestamp': timestamp
    };
  }
  // fromJson
  factory Todolist.fromJson(Map<String, dynamic> json, String id) {
    return Todolist(
      id: id,
      titulo: json['titulo'],
      userId: json['userid'],
      timestamp: json['timestamp'].toDate()
    );
  }
}