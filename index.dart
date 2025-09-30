int fatorial(int n) {
  if (n <= 1) {
    return 1;
  } else {
    return n * fatorial(n - 1);
  }
}

void main() {
  var numero = 5;
  int result = fatorial(numero);
  print("O fatorial de $numero é $result");
}
