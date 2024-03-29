import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:teste/control/ConectaBD.dart';
import 'package:teste/control/Usuario_controller.dart';
import 'package:teste/model/Usuario_model.dart';


class CadastroPage extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  CadastroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _senhaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Capturar os dados dos campos de texto
                String nome = _nomeController.text;
                String email = _emailController.text;
                String senha = _senhaController.text;

                // Criar um objeto Usuario com os dados capturados
                Usuario usuario = Usuario(id: 0, nome: nome, email: email, senha: senha);

                // Conectar ao banco de dados
                PostgreSQLConnection connection = await conectarAoBancoDeDados();

                // Utilizar o UsuarioController para enviar os dados para o banco de dados
                UsuarioController usuarioController = UsuarioController(connection);
                await usuarioController.cadastrarUsuario(usuario);

                // Limpar os campos de texto após o cadastro
                _nomeController.clear();
                _emailController.clear();
                _senhaController.clear();

                // Exibir uma mensagem de sucesso
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cadastro realizado com sucesso!')),
                );
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
