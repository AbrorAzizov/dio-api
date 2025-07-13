import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/api_urls.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';
import '../models/sign_up_parameters.dart';

abstract class AuthApiService {
  Future<Either> signup( User user);
  Future<Either> signIn( User user);
}

class AuthApiServiceImp implements AuthApiService{
  @override
  Future<Either> signup(user)async{
    try {
      final response = sl<DioClient>().post(ApiUrls.signUp,data: user.toMap());
      return Right(response );
    } on DioException catch(e)  {
      final errorMessage = e.response?.data['message'] ?? 'unknown error';
    return Left(errorMessage);
    }
  }

  @override
  Future<Either> signIn(User data) async{
    try{
      final response = await sl<DioClient>().post(ApiUrls.signIn,data: data);
      return Right(response);
    }on DioException catch(e){
    final errorMessage = e.response?.data['message'] ?? 'unknown error';
    }
  }



}