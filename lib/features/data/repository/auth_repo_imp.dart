import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_sign_up/features/data/models/sign_up_parameters.dart';
import 'package:dio_sign_up/features/data/source/auth_api_data_service.dart';
import 'package:dio_sign_up/features/data/source/auth_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../service_locator.dart';
import '../../domain/repo/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  @override
  Future<Either> signIn(User user) async{

    final result = await sl<AuthApiService>().signIn(user);
    result.fold((l) => Left(_l
    ), (r) {

    },)

  }

  @override
  @override
  Future<Either> signUp(User user) async {
    final result = await sl<AuthApiService>().signup(user);

    return await result.fold<Future<Either>>(
          (l) async {
        return Left(l);
      },
          (data) async {
        final response = data as Response;

        final prefs = await SharedPreferences.getInstance();
        final token = response.data['token'];
        if (token is String) {
          await prefs.setString('token', token);
          return Right(data);
        } else {
          return Left("Token missing or invalid");
        }
      },
    );
  }


  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthLocalService>().isLoggedIn();
  }

}
