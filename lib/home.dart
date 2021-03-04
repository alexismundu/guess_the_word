import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is JuegoIniciadoState) {
              return Container(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text(state.titulo),
                            SizedBox(height: 10.0),
                            Text(
                              state.palabra,
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(state.contador.toString()),
                            Row(
                              children: [
                                MaterialButton(
                                    child: Text(
                                      "SKIP",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Colors.green,
                                    onPressed: () {
                                      BlocProvider.of<HomeBloc>(context)
                                          .add(SkipEvent());
                                    }),
                                MaterialButton(
                                    child: Text(
                                      "GOT IT",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Colors.green,
                                    onPressed: () {
                                      BlocProvider.of<HomeBloc>(context)
                                          .add(GotEvent());
                                    }),
                                MaterialButton(
                                    child: Text(
                                      "END GAME",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Colors.green,
                                    onPressed: () {
                                      BlocProvider.of<HomeBloc>(context)
                                          .add(EndEvent());
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is JuegoEndState) {
              return Container(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text(state.titulo),
                            SizedBox(height: 10.0),
                            Text(
                              state.contador.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: MaterialButton(
                            child: Text("PLAY AGAIN"),
                            color: Colors.green,
                            onPressed: () {
                              BlocProvider.of<HomeBloc>(context)
                                  .add(StartEvent());
                            }),
                      ),
                    ],
                  ),
                ),
              );
            } else
              return Container(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Get ready to"),
                          SizedBox(height: 10.0),
                          Text(
                            "Guess the word!",
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        child: Text(
                          "PLAY",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.green,
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context).add(StartEvent());
                        },
                      ),
                    ),
                  ],
                ),
              );
          },
        ),
      ),
    );
  }
}
