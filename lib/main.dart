import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login.dart';
import 'features/auth/presentation/bloc/login_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';

void main() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://example.com/api',
    ),
  );

  final remoteDataSource =
  AuthRemoteDataSourceImpl(dio);

  final repository =
  AuthRepositoryImpl(remoteDataSource);

  final loginUseCase =
  Login(repository);

  runApp(
    MyApp(
      loginUseCase: loginUseCase,
    ),
  );
}

class MyApp extends StatelessWidget {
  final Login loginUseCase;

  const MyApp({
    super.key,
    required this.loginUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => LoginBloc(loginUseCase),
        child: const LoginPage(),
      ),
    );
  }
}