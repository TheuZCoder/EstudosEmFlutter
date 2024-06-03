import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Produto.dart';

class ProdutoController{
  
  List<Produto> _listProdutos = [];

  List<Produto> get listProdutos => _listProdutos;

  //getprodutos From Json
  Future<List<Produto>> getProdutosFromJson () async {
    final response = await http.get(Uri.parse('http://localhost:3000/produtos'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      _listProdutos = body.map((dynamic item) => Produto.fromJson(item)).toList();
      return _listProdutos;
    } else {
      throw 'Erro ao carregar lista de produtos';
    }
  }

  //post de novos produtos
  Future<Produto> postProduto (Produto produto) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/produtos'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(produto.toJson()),
    );
    if (response.statusCode == 201) {
      return Produto.fromJson(jsonDecode(response.body));
    } else {
      throw 'Erro ao cadastrar produto';
    }
  }


}