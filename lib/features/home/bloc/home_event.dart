
import 'package:flutter/cupertino.dart' show immutable;

@immutable
abstract class HomeEvent {}

@immutable
class HomeEventFetchUsers extends HomeEvent {}
