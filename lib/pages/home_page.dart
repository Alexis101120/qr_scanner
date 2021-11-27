import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/direcciones_page.dart';
import 'package:qr_scanner/pages/mapas_page.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/widgets/custom_navigatorbar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
//Obtener el current opt
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Historial'),
          actions: [
            IconButton(onPressed: () {
             Provider.of<ScanListProvider>(context, listen:false).borrarTodos();
            }, icon: const Icon(Icons.delete_forever))
          ],
        ),
        body: const _HomePageBody(),
        bottomNavigationBar: const CustomNavigationBar(),
        floatingActionButton: const ScanButon(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked);
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return const MapasPage();
      case 1:
      scanListProvider.cargarScansPorTipo('http');
        return const DireccionesPage();
      default:
        return const MapasPage();
    }
  }
}
