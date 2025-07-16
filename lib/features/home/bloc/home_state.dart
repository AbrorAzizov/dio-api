
import 'package:dio_sign_up/features/domain/entity/user_entity.dart';
import 'package:flutter/cupertino.dart' show immutable;

@immutable
abstract class HomeState {}

@immutable
class HomeStateLoading extends HomeState {}


@immutable
class HomeStateLoaded extends HomeState {
  final User user ;

  HomeStateLoaded({required this.user});
}

@immutable
class HomeStateError extends HomeState {
  final String errorMessage ;

  HomeStateError({required this.errorMessage});
}


