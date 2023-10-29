import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeController extends ControllerMVC {
  factory HomeController() => _this ??= HomeController._();
  HomeController._();
  static HomeController? _this;
  List<int> listaDeNumeros = <int>[];
  String valorARetornar = "";
  int colorRed = 0;
  int colorGreen = 0;
  int colorBlue = 0;
  final rnd = Random();
  void llenarListaDeNumeros(int cantidadDeNumeros) {
    for (int i = 1; i <= cantidadDeNumeros; i++) {
      listaDeNumeros.add(i);
    }
  }

  String determinarValor(int numeroRecibido) {
    valorARetornar = numeroRecibido.toString();
    if (numeroRecibido % 3 == 0 && numeroRecibido % 5 != 0) {
      valorARetornar += ' = fizz';
    }
    if (numeroRecibido % 5 == 0 && numeroRecibido % 3 != 0) {
      valorARetornar += ' = buzz';
    }
    if (numeroRecibido % 3 == 0 && numeroRecibido % 5 == 0) {
      valorARetornar += ' = fizzbuzz';
    }
    return valorARetornar;
  }

  Widget rectangulo(String textoMostrarEnRectangulo) {
    colorRed = rnd.nextInt(255);
    colorGreen = rnd.nextInt(255);
    colorBlue = rnd.nextInt(255);
    return Container(
      height: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(colorRed, colorGreen, colorBlue, 1),
        border: const Border(
          top: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid),
          bottom: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid),
        ),
      ),
      child: Center(
        child: Text(
          textoMostrarEnRectangulo,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19, shadows: [
            Shadow(
              color: Colors.black,
              blurRadius: 5,
            )
          ]),
        ),
      ),
    );
  }
}
