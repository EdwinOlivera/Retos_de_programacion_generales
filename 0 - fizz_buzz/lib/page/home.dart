import 'package:fizz_buzz/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomePage extends StatefulWidget {
  final String nombrePagina;
  const HomePage(this.nombrePagina, {Key? key}) : super(key: key);
  @override
  StateMVC<HomePage> createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  late HomeController _con;
  late Size dimensionesPantalla;
  _HomePageState() : super(HomeController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as HomeController;
  }
  @override
  void initState() {
    super.initState();
    _con.llenarListaDeNumeros(10);
  }

  @override
  Widget build(BuildContext context) {
    dimensionesPantalla = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.nombrePagina),
      ),
      body: Container(
        color: Colors.amber,
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: 100,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _con.rectangulo(_con.determinarValor(index + 1));
          },
        ),
      ),
    );
  }
}
