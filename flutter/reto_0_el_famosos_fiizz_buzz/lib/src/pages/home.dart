import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  StateMVC<HomePage> createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  late HomeController _con;
  _HomePageState() : super(HomeController()) {
    _con = controller as HomeController;
  }
  @override
  void initState() {
    super.initState();
    _con.llenarListaDeNumeros(100);
  }
  // return _con.rectangulo(context, index.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("FIZZ BUZZ"),
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _con.rectangulo(context, _con.determinarValor(index + 1)),
              childCount: _con.listaDeNumeros.length,
            ),
          ),
        ],
      ),
    );
  }
}
