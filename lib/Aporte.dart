class Aporte {
  double _sueldo;
  double _mes;
  double _meses;
  
  double _tarifaBasica;
  double _valorExedente;
  double _fraccionExedente;

  int _cantidadMeses=9;

  Aporte(this._sueldo) {
    genValues();
  }

  void genValues() {
    if(_sueldo<500){
      _tarifaBasica=0;
      _fraccionExedente=0;
      _valorExedente=0;

    }else if(_sueldo<600){
      _tarifaBasica=2;
      _fraccionExedente=0.01;
      _valorExedente=_fraccionExedente*(_sueldo-500);
    }
    else if(_sueldo<800){
      _tarifaBasica=3;
       _fraccionExedente=0.03;
      _valorExedente=_fraccionExedente*(_sueldo-600);
    }
    else if(_sueldo<1000){
      _tarifaBasica=9;
       _fraccionExedente=0.05;
      _valorExedente=_fraccionExedente*(_sueldo-800);
    }
    else if(_sueldo<1500){
      _tarifaBasica=19;
      _fraccionExedente=0.075;
      _valorExedente=_fraccionExedente*(_sueldo-1000);
    }
    else if(_sueldo<2500){
      _tarifaBasica=57;
      _fraccionExedente=0.08;
      _valorExedente=_fraccionExedente*(_sueldo-1500);
    }
    else if(_sueldo<3500){
      _tarifaBasica=137;
      _fraccionExedente=0.085;
      _valorExedente=_fraccionExedente*(_sueldo-2500);
    }
    else if(_sueldo<4500){
      _tarifaBasica=222;
      _fraccionExedente=0.09;
      _valorExedente=_fraccionExedente*(_sueldo-3500);
    }
    else if(_sueldo<5500){
      _tarifaBasica=312;
      _fraccionExedente=0.1;
      _valorExedente=_fraccionExedente*(_sueldo-4500);
    }
    else if(_sueldo<7500){
      _tarifaBasica=412;
      _fraccionExedente=0.12;
      _valorExedente=_fraccionExedente*(_sueldo-5500);
    }
    else if(_sueldo<10000){
      _tarifaBasica=652;
      _fraccionExedente=0.14;
      _valorExedente=_fraccionExedente*(_sueldo-7500);
    }
    else if(_sueldo<20000){
      _tarifaBasica=1002;
      _fraccionExedente=0.16;
      _valorExedente=_fraccionExedente*(_sueldo-10000);
    }
    else if(_sueldo<50000){
      _tarifaBasica=2602;
      _fraccionExedente=0.20;
      _valorExedente=_fraccionExedente*(_sueldo-20000);
    }
    else if(_sueldo<100000){
      _tarifaBasica=8602;
      _fraccionExedente=0.25;
      _valorExedente=_fraccionExedente*(_sueldo-50000);
    }
    else if(_sueldo<250000){
      _tarifaBasica=21102;
      _fraccionExedente=0.30;
      _valorExedente=_fraccionExedente*(_sueldo-100000);
    }
    else{
      _tarifaBasica=66102;
      _fraccionExedente=0.35;
      _valorExedente=_fraccionExedente*(_sueldo-250000);
    }

    _mes=_tarifaBasica+_valorExedente;
    _meses=_cantidadMeses*_mes;
  }

  String getMes(){
    return _mes.toString();
  }

  String getMeses(){
    return _meses.toString();
  }

  String gettarifaBasica(){
    return _tarifaBasica.toString();
  }
  String getvalorExedente(){
    return _valorExedente.toString();
  }

  String getfraccionExedente(){
    return _fraccionExedente.toString()+" %";
  }
}
