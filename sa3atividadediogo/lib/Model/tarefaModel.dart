 class Tarefa{
  int? id;
  final String nome;
  final String descricao;


  Tarefa({
    this.id,
    required this.nome,
    required this.descricao
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, 
      'nome': nome,
      'descricao': descricao,
    };
  }
  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      id: map['id'],
      nome: map['nome'],
      descricao: map['descricao'],
    );
  }
 }