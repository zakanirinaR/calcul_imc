import "dart:math";

class BmiModel {
  late num taille;
  late num poids;

  num calcImc() {
    return poids / ((taille / 100) * (taille / 100));
  }

  String categorieImc(num imc) {
    if (imc < 18.5) {
      return "En sous-poids";
    } else if (imc >= 18.5 && imc <= 24.9) {
      return "Poids normal";
    } else if (imc >= 25 && imc >= 29.9) {
      return "En surpoids";
    } else {
      return "Obèse";
    }
  }
}
