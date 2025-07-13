import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio_sign_up/features/bloc/auth_state.dart';
import 'package:dio_sign_up/features/data/repository/auth_repo_imp.dart';
import 'package:dio_sign_up/features/domain/repo/auth_repo.dart';

import '../../service_locator.dart';
import '../data/models/sign_up_parameters.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super (AuthStateInitial());


  Future<void> initialize() async{

    final isLoggedIn = await sl<AuthRepo>().isLoggedIn();
    if (isLoggedIn){
      emit (AuthStateLoggedIn());
    } else {
      emit( AuthStateSignup());
    }
  }


  Future<void> sigUp (User user) async{
    emit(AuthStateLoading());
    try{
      Either response = await AuthRepoImp().signUp(user);
      response.fold((error){
        emit(AuthStateError(authError: error));
      }, (data){
        emit(AuthStateLoggedIn());
      });
    }catch (e){
      emit(AuthStateError(authError: "$e"));
    }

  }

  Future<void> signIn (User user) async{
    emit(AuthStateLoading());
    try{
      Either response = await AuthRepoImp().signIn(user);
      response.fold((error){
        emit(AuthStateError(authError: error));
      }, (data){
        emit(AuthStateLoggedIn());
      });
    }catch (e){
      emit(AuthStateError(authError: "$e"));
    }

  }
}