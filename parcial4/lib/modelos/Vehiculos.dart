class Vehiculos {
  String ID_Vehiculo;
  String sMarca;
  String sModelo;

 
  Vehiculos({
    this.ID_Vehiculo='',
    required this.sMarca,
    required this.sModelo,

  });



  Map<String,dynamic> toJson()=>{
    'ID_Vehiculo':ID_Vehiculo,
    'sMarca':sMarca,
    'sModelo':sModelo,

  };

  static Vehiculos fromJson(Map<String,dynamic> json)=>Vehiculos(
    ID_Vehiculo: json['ID_Vehiculo'],
    sMarca: json['sMarca'], 
    sModelo: json['sModelo']
  );
  
}
