void main(){
  escolherMeioTransporte(Transporte.carro);
  Set<String> registrosVisitados = <String>{};
  registrosVisitados = registrarDestinos("São Paulo", registrosVisitados);
  print(registrosVisitados);
  
  Map<String, double> registrarPrecos = {};
  
  registrarPrecos["São Paulo"] = 1200;
  registrarPrecos["Rio Janeiro"] = 1500;
  
  print(registrarPrecos);
  
  Viagem viagem = 
}

class Viagem ={}
Set<String> registrarDestinos(String destinos, Set<String> banco){
  banco.add(destinos);
  return banco;
}

void escolherMeioTransporte (Transporte locomocao){
  switch(locomocao){
    case Transporte.carro:
      print("Vou de CARRO!");
      break;
      
    case Transporte.bike:
      print("Vou de BIKE");
      break;
      
    case Transporte.onibus:
      print("Vou de ONIBUS");
      break;
      
    default:
      print("Estou indo para a aventura");
  }
}

enum Transporte{
  carro,
  bike,
  onibus,
  andando,
  skate,
  aviao,
  patins,
  trem,
}
