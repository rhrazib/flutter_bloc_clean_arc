import '../../domain/entities/user.dart';

class LoginResponseModel {
  final String token;
  final User user;

  const LoginResponseModel({
    required this.token,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'] as Map<String, dynamic>;

    return LoginResponseModel(
      token: json['token'] as String,
      user: User(
        id: userJson['id'] as int,
        name: userJson['name'] as String,
      ),
    );
  }
}