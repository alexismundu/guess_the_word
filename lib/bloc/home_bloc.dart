import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  List<String> list1 = [
    "Humanidad",
    "Cuerpo",
    "Adulto",
    "Bebé",
    "Pierna",
    "Costa",
    "Playa",
    "Río",
    "Rojo",
    "Mar",
    "Perro",
    "Gato",
    "Lagarto"
  ];
  List<String> list2;
  int _counter = 0;
  int _index = 0;
  final String inGameTitle = "The word is...";
  final String endGameTitle = "You Scored";

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is StartEvent) {
      _index = 0;
      _counter = 0;
      list2 = new List<String>.from(list1);
      list2.shuffle();
      yield _instanceJuegoIniciado();
    } else if (event is SkipEvent) {
      if (list1[_index] != list2[_index]) _counter++;
      _index++;
      if (_index < list1.length)
        yield _instanceJuegoIniciado();
      else
        yield JuegoEndState(contador: _counter, titulo: "You Scored");
    } else if (event is GotEvent) {
      if (list1[_index] == list2[_index]) _counter++;
      _index++;
      if (_index < list1.length) {
        yield _instanceJuegoIniciado();
      } else {
        yield _instanceJuegoEndState();
      }
    } else if (event is EndEvent) {
      yield _instanceJuegoEndState();
    }
  }

  JuegoIniciadoState _instanceJuegoIniciado() {
    return JuegoIniciadoState(
        contador: _counter, palabra: list1[_index], titulo: inGameTitle);
  }

  JuegoEndState _instanceJuegoEndState() {
    JuegoEndState(contador: _counter, titulo: endGameTitle);
  }
}
