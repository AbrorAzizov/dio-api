import 'package:dio_sign_up/features/bloc/auth_cubit.dart';
import 'package:dio_sign_up/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/pages/auth_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (_) => sl<AuthCubit>()..initialize(),
      child: MaterialApp(
        home: AuthView(),
      ),
    );
  }
}
