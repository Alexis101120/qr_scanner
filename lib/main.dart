import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

import 'pages/home_page.dart';
import 'pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute:  'home',
        routes: {
          'home' : ( _ ) => const HomePage(),
          'mapa' : ( _ ) => const MapPage()
        },
        theme: ThemeData(
          primarySwatch: Colors.deepPurple
        ),
      ),
    );
  }
} 