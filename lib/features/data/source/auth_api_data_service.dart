import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/api_urls.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';
import '../models/sign_up_parameters.dart';

abstract class AuthApiService {
  Future<Either> signup(UserModel user);

  Future<Either> signIn(UserModel user);

  Future<Either> getUser();
}

class AuthApiServiceImp implements AuthApiService {
  @override
  Future<Either> signup(user) async {
    try {
      final response = sl<DioClient>().post(ApiUrls.signUp, data: user.toMap());
      return Right(response);
    } on DioException catch (e) {
      final errorMessage = e.response?.data['message'] ?? 'unknown error';
      return Left(errorMessage);
    }
  }

  @override
  Future<Either> signIn(UserModel data) async {
    try {
      final response = await sl<DioClient>().post(ApiUrls.signIn, data: data);
      return Right(response);
    } on DioException catch (e) {
      final errorMessage = e.response?.data['message'] ?? 'unknown error';
      return errorMessage;
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      final pref = await SharedPreferences.getInstance();
      final token = await pref.getString('token');
      final response = sl<DioClient>().get(
          ApiUrls.getProfile,
          options: Options(headers: {'Authorization': 'Bearer $token'})
      );
      return Right(response);
    } on DioException catch (e) {
      final errorMessage = e.response?.data['message'] ?? 'unknown error';
      return Left(errorMessage);
    }
  }


}