import 'package:exemplo_persistencia_json2/Controller/ProdutoController.dart';
import 'package:exemplo_persistencia_json2/View/Produto_Info_View.dart';
import 'package:flutter/material.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  ProdutosController controller = ProdutosController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista Produtos"),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Expanded(
            child: FutureBuilder(
              future: controller.loadProdutos(),
              builder: (context, snapshot) {
                if (controller.produtos.isNotEmpty) {
                  return ListView.builder(
                    itemCount: controller.produtos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${controller.produtos[index].nome} " +
                            "${controller.produtos[index].preco}"),
                        subtitle: Text(controller.produtos[index].categoria),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProdutoInfoView(produto: controller.produtos[index],)),
                        ),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              controller
                                  .deleteProduto(controller.produtos[index].id);
                            }),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }
}
