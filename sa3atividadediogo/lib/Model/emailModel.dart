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