class Fatorial {
  int numero;

  Fatorial(this.numero);

  int calcular() {
    if (numero <= 1) {
      return 1;
    }
    return numero * Fatorial(numero - 1).calcular();
  }
}

void main() {
  int numero = 10;
  Fatorial f = Fatorial(numero);
  int resultado = f.calcular();

  print("O fatorial de ${numero} é $resultado");
}
