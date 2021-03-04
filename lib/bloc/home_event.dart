part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class SkipEvent extends HomeEvent {
  final bool result = false;
  @override
  List<Object> get props => [result];
}

class GotEvent extends HomeEvent {
  final bool result = true;
  @override
  List<Object> get props => [result];
}

class EndEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}
