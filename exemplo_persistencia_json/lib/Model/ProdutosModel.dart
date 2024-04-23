class Produto {
  final int id;
  final String nome;
  final double preco;
  final String categoria;

  Produto({required this.id,required this.nome, required this.preco, required this.categoria});

  Map<String, dynamic> toJson() {
    return {'id':id ,'nome': nome, 'preco': preco, 'categoria': categoria};
  }

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      nome: json['nome'],
      preco: json['preco'],
      categoria: json['categoria'],
    );
  }
}
