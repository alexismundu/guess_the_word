import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc _homeBloc = HomeBloc();

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _homeBloc,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is JuegoIniciadoState) {
              return _createDefaultOrInGameWidget(state);
            } else if (state is JuegoEndState) {
              return _createEndGameWidget(state);
            }
            return _createDefaultOrInGameWidget(state);
          },
        ),
      ),
    );
  }

  Widget _createDefaultOrInGameWidget(state) {
    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state is HomeInitial ? "Get ready to..." : state.titulo),
                SizedBox(height: 10.0),
                Text(
                  state is HomeInitial ? "Guess the word!" : state.palabra,
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 28.0),
              child: _createFooter(state),
            ),
          )
        ],
      ),
    );
  }

  Widget _createFooter(state) {
    if (state is JuegoIniciadoState) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Text(
              state.contador.toString(),
              style: TextStyle(color: Colors.green, fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  child: Text(
                    "SKIP",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  onPressed: () {
                    _homeBloc.add(SkipEvent());
                  }),
              MaterialButton(
                  child: Text(
                    "GOT IT",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    _homeBloc.add(GotEvent());
                  }),
              MaterialButton(
                  child: Text(
                    "END GAME",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  onPressed: () {
                    _homeBloc.add(EndEvent());
                  }),
            ],
          ),
        ],
      );
    }
    return MaterialButton(
      child: Text(
        "PLAY",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: Colors.green,
      onPressed: () {
        _homeBloc.add(StartEvent());
      },
    );
  }

  Widget _createEndGameWidget(JuegoEndState state) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                Text(state.titulo),
                SizedBox(height: 10.0),
                Text(
                  state.contador.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
            MaterialButton(
                child: Text(
                  "PLAY AGAIN",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
                onPressed: () {
                  _homeBloc.add(StartEvent());
                }),
          ],
        ),
      ),
    );
  }
}
