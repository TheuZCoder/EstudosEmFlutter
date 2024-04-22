import 'dart:convert';

import 'package:exemplo_persistencia_json/Model/ProdutosModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Produto> _produtos = [];
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Future<void> _loadProdutos() async {
    final data = await rootBundle.loadString('assets/produtos.json');
    final jsonList = json.decode(data) as List<dynamic>;
    setState(() {
      _produtos = jsonList.map((e) => Produto(
              nome: e['nome'], 
              preco: e['preco'], 
              categoria: e['categoria']
            )).toList();
    });
  }

  Future<void> _saveProdutos() async{
    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = '${appDocDir.path}/produtos.json';
    final jsonlist = _produtos.map((produto) => produto.toJson()).
  }
}
