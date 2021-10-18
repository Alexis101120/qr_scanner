
import 'package:flutter/material.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context ,ScanModel scan) async{
  final url = scan.valor;

  if( scan.tipo =='http' ){
    //abrir el sitio web
    if(await canLaunch(url)) {
    await launch(url);
  }else{
    throw 'no se pudo lanzar $url';
  }
  }else{
        Navigator.pushNamed(context,'mapa', arguments: scan);
  }  
}