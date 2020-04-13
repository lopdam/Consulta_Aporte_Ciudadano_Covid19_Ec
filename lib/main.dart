import 'package:consulta_aporte_ciudadano/consulta.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: Consulta(title: 'Consulta Aporte Ciudadano Covid19 Ecuador'),
  ));
}
