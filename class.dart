void main() {

}
class Fruta extends Alimento implements Bolo{
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;
  
  Fruta(String  nome, double peso, String cor, this.sabor, this.diasDesdeColheita, {this.isMadura}): super(nome,peso,cor);
  
  void estaMadura(int diasParaMadura){
    isMadura = diasDesdeColheita >= diasParaMadura;
    print("A sua $nome foi colhida a $diasDesdeColheita dias, e precisa  de $diasParaMadura para poder comer. Ela está madura? $isMadura");
  }
  
  void fazerSuco(){
    print("Voce fez um otimo suco de $nome");
  }
  
  @override
  void separarIgredientes(){
    print("Catar a fruta");
  }
  
  @override
  void fazerMassa(){
    print("fazendo a massa...");
  }
  
  @override
  void assar(){
    print("Assando...");
  }
}

class Alimento{
  String nome;
  double peso;
  String cor;
  
  Alimento(this.nome, this.peso, this.cor);

  void printAlimento(){
    print("Este(a) $nome pesa $peso gramas e é $cor.");
  }
}

class Legumes extends Alimento implements Bolo {

  bool isPrecisaCozinhar;
  
  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar) : super(nome, peso, cor);
  
  void cozinhar(){
    isPrecisaCozinhar ?  print("Pronto, o $nome está cozinhando!") : print("Não precisa cozinhar");
  }
  
  @override
  void assar(){}
  
  @override
  void fazerMassa(){}
  
  @override
  void separarIgredientes(){}
}

class Citricas extends Fruta{
  double nivelAzedo;
  
  Citricas(String nome, double peso, String cor,String sabor, int diasDesdeColheita,
            this.nivelAzedo): super(nome, peso, cor, sabor ,diasDesdeColheita);
  
  void existeRefri(bool existe){
    if(existe){
      print("Existe refrigerante e $nome");
    }else{
      print("Não existe refri de $nome");
    }
  }
}

class Nozes extends Fruta{

  double porcentagemOleoNatural;
  
  Nozes (String nome, double peso, String cor,String sabor, int diasDesdeColheita, this.porcentagemOleoNatural): super(nome, peso, cor, sabor, diasDesdeColheita);
  
  @override
  void fazerMassa(){
    print("Tirar a casaca");
    super.fazerMassa();
  }
}

abstract class Bolo{
  void separarIgredientes();
  void fazerMassa();
  void assar();
}
