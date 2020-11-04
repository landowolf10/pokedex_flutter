import 'package:flutter/material.dart';
import 'package:pokedex/models/pokedex_model.dart';
import 'package:pokedex/src/pages/pokedex_region.dart';

List<String> precioProducto = new List<String>();

class MainPokedex extends StatefulWidget {
  @override
  MainPokedexState createState() => new MainPokedexState();
}

class MainPokedexState extends State<MainPokedex> {
  RegionSelectorState dex = new RegionSelectorState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokedex Kanto"),
        ),
        body: Container(
            alignment: Alignment.center,
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 400,
                      child: FutureBuilder<List<Pokemon>>(
                        future: dex.getPokemonData(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return CircularProgressIndicator();

                          var values = snapshot.data;

                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(values[index].pokemonName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      )),
                                );
                              });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 44.0,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.red,
                      child: Text(
                        'Regresar al menú',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext ctx) =>
                                    RegionSelector()));
                      }),
                )
              ],
            )));
  }
}
