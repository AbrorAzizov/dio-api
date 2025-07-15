import 'package:dio_sign_up/features/bloc/auth_state.dart';
import 'package:dio_sign_up/features/pages/home_page.dart';
import 'package:dio_sign_up/features/pages/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_cubit.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(builder: (context, state) {
      if(state is AuthStateLoggedIn){
        return HomePage();
      }
      if(state is AuthStateError){
        return Center(child: Text(state.authError),);
      }
      if(state is AuthStateLoading){
        return Center(child: CircularProgressIndicator());
      } if (state is AuthStateSignup){
        return SignupPage();
      }
      return Container();
    },);
  }
}
