import 'package:exemplo_persistencia_json2/Model/ProdutoModel.dart';
import 'package:flutter/material.dart';

class ProdutoInfoView extends StatelessWidget {
  Produto produto;
  ProdutoInfoView({
    required this.produto
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produto Info"),
      ),
      body: Center(
        child: Column(children: [
          Text(produto.nome),
          Text("${produto.preco}"),
          Text(produto.categoria),
          Image.asset(produto.imagem)
        ],),
      ),
    );
  }
}