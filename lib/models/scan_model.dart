



class ScanModel {
    ScanModel({
        this.id,
        this.tipo,
        required this.valor,
    }) {

      if ( this.valor.contains('http') ) {
        this.tipo = 'http';
      } else { 
        this.tipo = 'geo';
      }

    }

    int? id;
    String? tipo;
    String valor;

    factory ScanModel.fromJson(Map<String, dynamic> json ) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

//Realmente lo crea como mapa
    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
