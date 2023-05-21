class Usuarios {
  String ID_Cliente;
  String sNombreCliente;
  String sApellidosCliente;
  String sDireccionCliente;
  String sCiudadCliente;
 
  Usuarios({
    this.ID_Cliente='',
    required this.sNombreCliente,
    required this.sApellidosCliente,
    required this.sDireccionCliente,
    required this.sCiudadCliente,
  });



  Map<String,dynamic> toJson()=>{
    'ID_Cliente':ID_Cliente,
    'sNombreCliente':sNombreCliente,
    'sApellidosCliente':sApellidosCliente,
    'sDireccionCliente':sDireccionCliente,
    'sCiudadCliente':sCiudadCliente
  };

  static Usuarios fromJson(Map<String,dynamic> json)=>Usuarios(
    ID_Cliente: json['ID_Cliente'],
    sNombreCliente: json['sNombreCliente'], 
    sApellidosCliente: json['sApellidosCliente'],
    sDireccionCliente: json['sDireccionCliente'],
    sCiudadCliente: json['sCiudadCliente']
  );
  
}
