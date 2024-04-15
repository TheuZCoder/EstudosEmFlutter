class Usuario {
  //atributos
  int? id;
  String nome;
  String email;
  String senha;
  //construtor
  Usuario({
    required id,
    required this.nome,
    required this.email,
    required this.senha
  });

  Map<String, dynamic> toMap() {
    return{
      'id':id,
      'nome':nome,
      'email':email,
      'senha':senha
    };
  }

  factory Usuario.fromMap(Map<String, dynamic>map){
    return Usuario(id: map['id'], nome: map['nome'], email: map['email'], senha: map['senha']);
  }
}