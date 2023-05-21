// ignore_for_file: public_member_api_docs, sort_constructors_first

class UsuVehi {
  String ID_Cliente;
  String ID_Vehiculo;
  String sMatricula;
  int Kilometros;
  UsuVehi({
    this.ID_Cliente='',
    this.ID_Vehiculo='',
    required this.sMatricula,
    required this.Kilometros
  });

 



  Map<String,dynamic> toJson()=>{
    'ID_Cliente':ID_Cliente,
    'ID_Vehiculo':ID_Vehiculo,
    'sMatricula':sMatricula,
    'Kilometros':Kilometros
  };

  static UsuVehi fromJson(Map<String,dynamic> json)=>UsuVehi(
    ID_Cliente: json['ID_Cliente'],
    ID_Vehiculo: json['ID_Vehiculo'], 
    sMatricula: json['sMatricula'],
    Kilometros: json['Kilometros']
  );
  
}
