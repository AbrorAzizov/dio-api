import 'package:dio_sign_up/features/domain/repo/auth_repo.dart';
import 'package:dio_sign_up/features/home/bloc/home_event.dart';
import 'package:dio_sign_up/features/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeStateLoading()) {
    on<HomeEventFetchUsers>(_onFetchUserProfile);
  }

  Future<void> _onFetchUserProfile(
      HomeEventFetchUsers event, Emitter<HomeState> emit) async {
    emit(HomeStateLoading());
    final result = await sl<AuthRepo>().getUser();
    result.fold(
      (error) {
        emit(HomeStateError(errorMessage: error['message']));
      },
      (data) {
        emit(HomeStateLoaded(user: data));
      },
    );
  }
}
