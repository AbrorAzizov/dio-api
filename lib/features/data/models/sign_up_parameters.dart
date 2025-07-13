class User {
  final String password;
  final String email;
  final String? name;

  User({
    required this.password,
    required this.email,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'name': name ?? '',
    };
  }
}
