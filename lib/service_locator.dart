import 'package:dio_sign_up/features/bloc/auth_cubit.dart';
import 'package:dio_sign_up/features/data/repository/auth_repo_imp.dart';
import 'package:dio_sign_up/features/domain/repo/auth_repo.dart';
import 'package:dio_sign_up/features/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio_client.dart';
import 'features/data/source/auth_api_data_service.dart';
import 'features/data/source/auth_local_service.dart';

final sl = GetIt.instance;

void setupServiceLocator () {
 sl.registerSingleton<DioClient>(DioClient());
 sl.registerSingleton<AuthApiService>(AuthApiServiceImp());
 sl.registerSingleton<AuthRepo>(AuthRepoImp());
 sl.registerSingleton<AuthCubit>(AuthCubit());
 sl.registerSingleton<AuthLocalService>(AuthLocalServiceImp());
 sl.registerSingleton<HomeBloc>(HomeBloc());
}