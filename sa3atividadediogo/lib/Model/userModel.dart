class User {
  int? id; 
  final String email;
  final String password;

  User({
    this.id, 
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, 
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

