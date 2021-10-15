
import 'package:flutter/material.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{

  List<ScanModel?> scans = [];
  String tipoSeleccionado = 'http';

  nuevoSca( String valor ) async{
    final nuevoScan = new ScanModel( valor: valor );
    final id = await DBProvider.db.nuevoScan( nuevoScan);
    nuevoScan.id = id;
    if(tipoSeleccionado == nuevoScan.tipo){
      scans.add( nuevoScan );
      notifyListeners();
    }
  }

  cargarScans() async{
    final scans = await DBProvider.db.getScans();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScansPorTipo( String tipo) async{
    final scans = await DBProvider.db.getScansByTipo(tipo);
    this.scans = [...scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async{
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async{
    await DBProvider.db.deleteAllScans(); 
    cargarScansPorTipo(tipoSeleccionado);
  }

}