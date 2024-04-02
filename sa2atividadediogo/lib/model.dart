class User {
  int? id; // Tornando o id opcional

  final String email;
  final String password;

  User({
    this.id, // Deixando o id opcional
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Incluindo o id no mapa se não for nulo
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      password: map['password'],
    );
  }
}

class Email {
  final String email;

  Email({required this.email});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  factory Email.fromMap(Map<String, dynamic> map) {
    return Email(
      email: map['email'],
    );
  }
}
