import 'package:hive/hive.dart';
part 'person.g.dart';

@HiveType(typeId: 0)
class Person {
  @HiveField(0)
  String name;
  @HiveField(1)
  double weight;
  @HiveField(2)
  double height;

  Person({required this.name, required this.weight, required this.height});

  void setName(String name) {
    this.name = name;
  }

  void setWeight(double weight) {
    this.weight = weight;
  }

  void setHeight(double height) {
    this.height = height;
  }

  String getHeight() {
    return height.toString();
  }

  String getWeight() {
    return weight.toString();
  }

  double getImc() {
    if (height <= 0) {
      return 0;
    } else {
      return weight / (height * height);
    }
  }

  String getImcString() {
    var imc = getImc();
    return imc.toStringAsFixed(imc.truncateToDouble() == imc ? 0 : 2);
  }

  String getImcMessage() {
    switch (getImc()) {
      case > 16 && < 17:
        return 'Magreza moderada';
      case > 17 && < 18.5:
        return 'Magreza leve';
      case > 18.5 && < 25:
        return 'Saudável';
      case > 25 && < 30:
        return 'Sobrepeso';
      case > 30 && < 35:
        return 'Obesidade grau I';
      case > 35 && < 40:
        return 'Obesidade grau II (severa)';
      case >= 40:
        return 'Obesidade grau III (mórbida)';
      default:
        return 'Magreza grave';
    }
  }
}
