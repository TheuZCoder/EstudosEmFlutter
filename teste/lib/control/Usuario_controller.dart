import 'package:postgres/postgres.dart';
import 'package:teste/model/Usuario_model.dart';


class UsuarioController {
  final PostgreSQLConnection _connection;

  // Construtor que recebe uma conexão com o banco de dados
  UsuarioController(this._connection);

  Future<void> cadastrarUsuario(Usuario usuario) async {
    await _connection.query(
      'INSERT INTO usuarios (nome, email, senha) VALUES (@nome, @email, @senha)',
      substitutionValues: {
        'nome': usuario.nome,
        'email': usuario.email,
        'senha': usuario.senha,
      },
    );
  }

  Future<Usuario?> autenticarUsuario(String email, String senha) async {
    final results = await _connection.query(
      'SELECT * FROM usuarios WHERE email = @email AND senha = @senha',
      substitutionValues: {
        'email': email,
        'senha': senha,
      },
    );

    if (results.isNotEmpty) {
      return Usuario.fromJson(results.first.toColumnMap());
    } else {
      return null;
    }
  }
}
