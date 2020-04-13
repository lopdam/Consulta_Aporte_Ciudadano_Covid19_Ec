import 'package:consulta_aporte_ciudadano/Aporte.dart';
import 'package:flutter/material.dart';

class Consulta extends StatefulWidget {
  Consulta({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Consulta createState() => _Consulta();
}

class _Consulta extends State<Consulta> {
  String _mes = "00.00";
  String _meses = "000.00";
  double _sueldo = 0.0;
  String _mensaje = "";
  bool _visible = false;

  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: SafeArea(
          child: Center(
        child: Container(
          width: 400,
          height: 500,
          child: _body(),
        ),
      )),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(widget.title),
    );
  }

  Widget _body() {
    return ListView(
      children: <Widget>[_cardInputContainer(), _cardOutputContainer()],
    );
  }

  Container _cardInputContainer() {
    return Container(
      child: _cardInput(),
    );
  }

  Container _cardOutputContainer() {
    return Container(
      child: _cardOutput(),
    );
  }

  Widget _cardInput() {
    return Card(
        elevation: 7.0,
        color: Colors.blue,
        child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  "Consultar Aporte",
                  style: TextStyle(fontSize: 32.0, color: Colors.white),
                ),
                _textInputSueldo(),
                _button(),
                Visibility(
                  child: Text(
                    _mensaje,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Colors.red),
                  ),
                  visible: _visible,
                ),
              ],
            ),
            margin: EdgeInsets.all(24.0)));
  }

  Container _textInputSueldo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      padding: EdgeInsets.only(right: 4.0, left: 4.0),
      margin: EdgeInsets.only(left: 24.0, right: 24.0, top: 8.0, bottom: 8.0),
      child: TextField(
        controller: _textController,
        keyboardType: TextInputType.number,
        maxLines: 1,
        showCursor: true,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.attach_money,
          ),
          suffixText: "USD",
          hintText: "Ingresar Sueldo",
        ),
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  RaisedButton _button() {
    return RaisedButton(
      elevation: 6.0,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
      splashColor: Colors.white,
      color: Colors.green[700],
      child: Text(
        "  Consultar  ",
        style: TextStyle(color: Colors.white, fontSize: 15.0),
      ),
      onPressed: () {
        try {
          _sueldo = double.parse(_textController.text);

          if (_sueldo < 0) {
            throw Exception;
          } else {
            _visible = false;
            _mensaje = "";

            Aporte _aporte = Aporte(_sueldo);
            _mes = _aporte.getMes();
            _meses = _aporte.getMeses();
          }
        } catch (Exeption) {
          _visible = true;
          _mes = "00.00";
          _meses = "000.00";
          if (_textController.text.compareTo("") == 0) {
            _mensaje = "Ingresar Valor";
          } else {
            _mensaje = "Ingrese Valor Correcto";
          }
        }
        setState(() {});
      },
    );
  }

  Widget _cardOutput() {
    return Card(
      elevation: 7.0,
      color: Colors.blue,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.monetization_on,
                size: 50,
                color: Colors.white,
              ),
              title: Text(
                _mes,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Mes',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading:
                  Icon(Icons.monetization_on, size: 50, color: Colors.white),
              title: Text(
                _meses,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "9 Meses",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        margin: EdgeInsets.all(24.0),
      ),
    );
  }
}
