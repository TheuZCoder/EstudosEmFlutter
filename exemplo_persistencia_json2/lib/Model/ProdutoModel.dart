class Produto {
  final int id;
  final String nome;
  final int preco;
  final String categoria;
  final String imagem;

  const Produto({
  required this.id,
  required this.nome,
  required this.preco,
  required this.categoria,
  required this.imagem,
  });

  Map<String,dynamic> toJson(){
    return{
      'id': id,
      'nome': nome,
      'preco': preco,
      'categoria': categoria,
      'imagem': imagem,
    };
  }

  factory Produto.fromJson( Map<String,dynamic> json){
    return Produto(
      id: json['id'],
      nome: json['nome'],
      preco: json['preco'],
      categoria: json['categoria'],
      imagem: json['imagem']
    );
  }
 
}