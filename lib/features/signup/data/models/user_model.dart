class UserModel {
  final String email;
  final String name;
  final String password;

  UserModel({
    required this.email,
    required this.name,
    this.password = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
    );
  }
}
