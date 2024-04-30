class Livros{
  final int id;
  final String titulo;
  final String autor;
  final int sinopse;
  final String capa;
  final String editora;
  final double preco;
  final String isbn;
  List<String> categoria;

  Livros({
    required this.id, 
    required this.titulo, 
    required this.autor, 
    required this.sinopse, 
    required this.capa, 
    required this.editora,
    required this.preco,
    required this.isbn,
    required this.categoria
  });

  //metodos

  Map<String,dynamic> toJson(){
    return{
      "id": id,
      "titulo": titulo,
      "autor": autor,
      "sinopse": sinopse,
      "capa": capa,
      "editora": editora,
      "preco": preco,
      "isbn": isbn,
      "categoria": categoria
    };
  }


  factory Livros.fromJson(Map<String,dynamic> json) {
    return Livros(
      id: json["id"],
      titulo: json["titulo"],
      autor: json["autor"],
      sinopse: json["sinopse"],
      capa: json["capa"],
      editora: json["editora"],
      preco: json["preco"],
      isbn: json["isbn"],
      categoria: json["categoria"]
    ); //Livros
  }
  

}