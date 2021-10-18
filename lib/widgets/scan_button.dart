
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';



class ScanButon extends StatelessWidget {
  const ScanButon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#3d8bef', 'Cancelar', false, ScanMode.QR);
          
          final scanListProvider = Provider.of<ScanListProvider>(context, listen:false);
          if(barcodeScanRes != '-1'){
            return;
          }
          final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
          launchURL(context, nuevoScan);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}