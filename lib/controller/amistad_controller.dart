import '../model/amistad_model.dart';

class AmistadController {
  String verificarAmigos(String aTexto, String bTexto) {
    if (aTexto.trim().isEmpty || bTexto.trim().isEmpty) {
      return 'Los campos no pueden estar vacíos';
    }

    int? a = int.tryParse(aTexto.trim());
    int? b = int.tryParse(bTexto.trim());

    if (a == null || b == null) {
      return 'Ingrese números enteros válidos';
    }

    if (a <= 0 || b <= 0) {
      return 'Los números deben ser enteros positivos';
    }

    final sonAmigos = AmistadModel.sonAmigos(a, b);

    if (sonAmigos) {
      return 'Los números $a y $b SÍ son amigos';
    } else {
      return 'Los números $a y $b NO son amigos';
    }
  }
}