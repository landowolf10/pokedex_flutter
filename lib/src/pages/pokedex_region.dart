import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokedex_model.dart';
import 'package:pokedex/src/pages/pokedex.dart';

class RegionSelector extends StatefulWidget {
  @override
  RegionSelectorState createState() => new RegionSelectorState();
}

class RegionSelectorState extends State<RegionSelector>
    with SingleTickerProviderStateMixin {
  List<Pokemon> pokemonList;

  Future<List<Pokemon>> getPokemonData() async {
    final response =
        await http.get('https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data['results']);

      pokemonList = data['results'].map<Pokemon>((json) {
        return Pokemon.fromJson(json);
      }).toList();
    } else {
      throw Exception('Unable to fetch Pokémon from the REST API');
    }

    return pokemonList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: ButtonTheme(
                        minWidth: 50.0,
                        height: 100.0,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: Colors.red,
                            child: Column(
                              children: [
                                Text(
                                  'Pokedex Kanto',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext ctx) =>
                                          MainPokedex()));
                            }),
                      ),
                    ),
                    SizedBox(width: 20),
                    Flexible(
                      child: ButtonTheme(
                        minWidth: 50.0,
                        height: 100.0,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: Colors.red,
                            child: Column(
                              children: [
                                Text(
                                  'Pokedex Johto',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                            onPressed: () {}),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          )
        ],
      ),
    );
  }
}
