
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';



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
          scanListProvider.nuevoScan(barcodeScanRes);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}