class AmistadModel {
  static int sumaDivisoresPropios(int numero) {
    int suma = 0;

    for (int i = 1; i <= numero ~/ 2; i++) {
      if (numero % i == 0) {
        suma += i;
      }
    }

    return suma;
  }

  static bool sonAmigos(int a, int b) {
    return sumaDivisoresPropios(a) == b &&
        sumaDivisoresPropios(b) == a;
  }
}