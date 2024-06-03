import 'package:flutter/material.dart';

import '../controllers/ProdutoController.dart';
import '../models/Produto.dart';

class ListaProdutosScreen extends StatefulWidget {
  const ListaProdutosScreen({super.key});

  @override
  State<ListaProdutosScreen> createState() => _ListaProdutosScreenState();
}

class _ListaProdutosScreenState extends State<ListaProdutosScreen> {

 final ProdutoController _controller = ProdutoController();

  Future<List<Produto>> futureProduto() async {
    try {
      return _controller.getProdutosFromJson();
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // listar prodtuos do json com future builder
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
      ),
      body: FutureBuilder<List<Produto>>(
        future: futureProduto(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].nome),
                  subtitle: Text('R\$ ${snapshot.data![index].preco.toString()}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}