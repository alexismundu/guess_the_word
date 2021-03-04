part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class JuegoIniciadoState extends HomeState {
  final String palabra;
  final String titulo;
  final int contador;

  JuegoIniciadoState(
      {@required this.palabra, @required this.contador, @required this.titulo});

  @override
  List<Object> get props => [palabra, titulo, contador];
}

class JuegoNextState extends HomeState {
  final String palabra;
  final String titulo;
  final int contador;

  JuegoNextState(
      {@required this.palabra, @required this.contador, @required this.titulo});

  @override
  List<Object> get props => [palabra, titulo, contador];
}

class JuegoEndState extends HomeState {
  final String titulo;
  final int contador;

  JuegoEndState({@required this.contador, @required this.titulo});

  @override
  List<Object> get props => [titulo, contador];
}
