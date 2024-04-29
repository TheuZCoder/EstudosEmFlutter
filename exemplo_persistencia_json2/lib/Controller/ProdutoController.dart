import 'dart:convert';

import 'package:exemplo_persistencia_json2/Model/ProdutoModel.dart';
import 'package:flutter/services.dart';

class ProdutosController {
  //Atributos
  List<Produto> produtos = [];

  Future<List<Produto>> loadProdutos() async { 
    final data = await rootBundle.loadString('assets/produtos.json');
    final jsonList = json.decode(data) as List<dynamic>;
    produtos.clear();
    produtos.addAll(jsonList.map((e) => Produto.fromJson(e))); 
    return produtos;
    }

  void deleteProduto(int id) {
    produtos.removeWhere((element) => element.id == id);
  }
}