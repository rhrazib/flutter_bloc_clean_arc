import 'package:dio/dio.dart';

import '../models/login_response_model.dart';

// DataSource শুধু API-এর সাথে কথা বলবে।
//
// Business logic এখানে রাখব না।

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<LoginResponseModel> login(
    String email,
    String password,
  ) async {
    final response = await dio.post(
      '/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    return LoginResponseModel.fromJson(
      Map<String, dynamic>.from(response.data as Map),
    );
  }
}
