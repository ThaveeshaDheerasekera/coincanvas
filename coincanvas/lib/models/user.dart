class User {
  final String id;
  final String email;
  final String password;

  User({
    required this.id,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json, String documentId) => User(
        id: documentId,
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
      };
}
