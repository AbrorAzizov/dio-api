import 'package:dartz/dartz.dart';
import 'package:dio_sign_up/features/data/models/sign_up_parameters.dart';

abstract class AuthRepo {
  Future<Either> signIn ();
  Future<Either> signUp (User user);
  Future<bool> isLoggedIn ();
}