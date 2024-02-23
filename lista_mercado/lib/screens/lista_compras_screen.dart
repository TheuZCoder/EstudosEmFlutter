// lista_compras_screen.dart
import 'package:flutter/material.dart';
import 'package:lista_mercado/models/item.dart';
import 'package:lista_mercado/screens/adicionar_item_screen.dart';
import 'package:lista_mercado/widget/item_widget.dart';
import 'package:lista_mercado/widget/notificacao_widget.dart';
import 'package:provider/provider.dart';

class ListaComprasScreen extends StatefulWidget {
  @override
  _ListaComprasScreenState createState() => _ListaComprasScreenState();
}

class _ListaComprasScreenState extends State<ListaComprasScreen> {
  List<Item> listaDeCompras = [];
  late NotificacaoWidget notificacaoWidget;

  @override
  void didChangeDependencies() {
    notificacaoWidget = Provider.of<NotificacaoWidget>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: ListView.builder(
        itemCount: listaDeCompras.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: listaDeCompras[index],
            onDelete: () {
              setState(() {
                listaDeCompras.removeAt(index);
              });
            },
            onUpdate: () {
              setState(() {
                listaDeCompras[index].concluido = !listaDeCompras[index].concluido;
              });

              if (listaDeCompras[index].concluido) {
                notificacaoWidget.mostrarNotificacaoDeItemPendente(listaDeCompras[index].nome);
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdicionarItemScreen(onAdd: _adicionarItem)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _adicionarItem(Item novoItem) {
    setState(() {
      listaDeCompras.add(novoItem);
    });
  }
}
