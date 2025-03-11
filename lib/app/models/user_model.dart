class User {
  final String id;
  final String? name;
  final String? email;

  User({required this.id, this.name, this.email});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? 'Unknown',
      email: map['email'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}