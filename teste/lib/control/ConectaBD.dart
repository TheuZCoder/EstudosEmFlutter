import 'package:postgres/postgres.dart';

Future<PostgreSQLConnection> conectarAoBancoDeDados() async {
  final connection = PostgreSQLConnection(
    'localhost',
    5432,
    'matheus',
    username: 'postgres',
    password: 'postgres',
  );

  await connection.open();

  return connection;
}
