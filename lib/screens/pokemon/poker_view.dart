import 'package:flutter/material.dart';
import 'package:pokemon/screens/pokemon/pokemon.dart';
import 'package:pokemon/screens/pokemon/poker_controller.dart';

class PokerView extends StatefulWidget {
  @override
  _PokerViewState createState() => _PokerViewState();
}

class _PokerViewState extends State<PokerView> {
  final pokerViewModel = PokerViewModel();

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<Pokemon>(
                stream: pokerViewModel.streamPokemon.stream,
                builder: (context, snapshot) {
                  print(snapshot.connectionState);
                  if (snapshot.connectionState != ConnectionState.active &&
                      snapshot.connectionState != ConnectionState.none) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(30.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: Colors.black)),
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    color: Colors.blue),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      snapshot.data.nome.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "EXP: ${snapshot.data.experience}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Image.network(
                                snapshot.data.urlImage,
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                color: Colors.blue,
                                height: 40,
                                child: Text(
                                  'Abilidades'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                height: 100,
                                child: ListView.builder(
                                    padding: const EdgeInsets.all(8),
                                    itemCount: snapshot.data.abilidades.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          child: Text(
                                            '${index + 1} - ${snapshot.data.abilidades[index].name}'
                                                .toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black),
                                          ));
                                    }),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      snapshot.error,
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    );
                  } else {
                    return Container(
                      width: double.infinity,
                    );
                  }
                }),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  pokerViewModel.loadPokemon();
                });
              },
              child: Text('Procurar Pokemon'),
            ),
          ],
        ));
  }
}
