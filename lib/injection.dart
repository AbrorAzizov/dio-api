import 'package:dio_sign_up/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/bloc/auth_cubit.dart';
import 'features/pages/auth_view.dart';

class Injection extends StatelessWidget {
  const Injection({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => sl<AuthCubit>()..initialize(),
        ),

      ],
      child: MaterialApp(
        home: AuthView(),
      ),
    );
  }
}
