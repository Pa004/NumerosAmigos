import '../model/amistad_model.dart';

class AmistadController {
  String verificarAmigos(String aTexto, String bTexto) {
    // Validar vacíos
    if (aTexto.trim().isEmpty || bTexto.trim().isEmpty) {
      return 'Los campos no pueden estar vacíos';
    }

    // Convertir a entero
    int? a = int.tryParse(aTexto.trim());
    int? b = int.tryParse(bTexto.trim());

    // Validar que sean números enteros válidos
    if (a == null || b == null) {
      return 'Ingrese números enteros válidos';
    }

    // Validar que sean positivos
    if (a <= 0 || b <= 0) {
      return 'Los números deben ser enteros positivos';
    }

    // Verificar amistad
    final sonAmigos = AmistadModel.sonAmigos(a, b);

    if (sonAmigos) {
      return 'Los números $a y $b SÍ son amigos';
    } else {
      return 'Los números $a y $b NO son amigos';
    }
  }
}