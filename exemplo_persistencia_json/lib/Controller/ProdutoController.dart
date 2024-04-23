

import 'dart:convert';
import 'dart:io';

import 'package:exemplo_persistencia_json/Model/ProdutosModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';


// Classe responsável por gerenciar as operações de produtos
class ProdutoController {
  final List<Produto> _produtos = []; // Lista de produtos


  List<Produto> get produtos =>
      _produtos; // Getter para acessar a lista de produtos


  // Método para carregar produtos do arquivo JSON
  Future<void> loadProdutos() async {
    // Carrega o conteúdo do arquivo JSON da pasta assets
    final data = await rootBundle.loadString('assets/produtos.json');
    // Decodifica o conteúdo JSON em uma lista dinâmica
    final jsonList = json.decode(data) as List<dynamic>;
    _produtos.clear();
    // Converte os objetos JSON em instâncias de Produto e adiciona à lista de produtos
    _produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));
  }


  // Método para salvar produtos no arquivo JSON
  Future<void> saveProdutos() async {
    // Obtém o diretório de documentos do aplicativo
    final appDocDir = await getApplicationDocumentsDirectory();
    // Caminho do arquivo produtos.json no diretório de documentos
    final filePath = '${appDocDir.path}/produtos.json';
    // Converte os produtos em uma lista de JSON
    final jsonList = _produtos.map((produto) => produto.toJson()).toList();
    // Escreve a lista de JSON no arquivo produtos.json
    await File(filePath).writeAsString(json.encode(jsonList));
  }

 Future<void> salvarProdutosNoArquivo() async {
    try {
      final jsonList = _produtos.map((produto) => produto.toJson()).toList();
      await File('assets/produtos.json').writeAsString(json.encode(jsonList));
    } catch (e) {
      print('Erro ao salvar produtos no arquivo: $e');
    }
  }

  Future<void> metodoRemoverProduto(int indice) async {
    if (indice >= 0 && indice < _produtos.length) {
      _produtos.removeAt(indice);
    }else {
      
    }
  }
  
  // Método para adicionar um novo produto à lista
  void adicionarProduto(Produto produto) {
    _produtos.add(produto);
  }
}
