
class ScanModel {
    ScanModel({
        this.id,
        this.tipo,
        this.valor,
    }){

      (this.valor.contains('http'))
      ?this.tipo = 'http'
      :this.tipo = 'geo';
      
    }

    int id;
    String tipo;
    String valor;

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id    : json["id"],
        tipo  : json["tipo"],
        valor : json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id"    : id,
        "tipo"  : tipo,
        "valor" : valor,
    };
}
