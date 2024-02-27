void main() {
  
}
class Fruta{
  String nome;
  double peso;
  String cor;
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;
  
  Fruta(this.nome, this.peso, this.cor, this.sabor, this.diasDesdeColheita, {this.isMadura});
  
  void estaMadura(int diasParaMadura){
    isMadura = diasDesdeColheita >= diasParaMadura;
    print("A sua $nome foi colhida a $diasDesdeColheita dias, e precisa  de $diasParaMadura para poder comer. Ela está madura? $isMadura");
  }
}
