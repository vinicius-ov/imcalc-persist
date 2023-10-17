import 'package:imcalcpersist/model/person.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Tests IMC values', () {
    Person pessoa = Person(name: 'Fulano', weight: 88.1, height: 1.88);

    test('calculate IMC', () {
      expect(pessoa.getImc(), 24.92643730194658);
    });

    test('calculated imc string formatted', () {
      expect(pessoa.getImcString(), '24.93');
    });
  });

  group('Tests IMC classification', () {
    var personList = {
      Person(name: 'A', weight: 88, height: 1.8): 'Sobrepeso',
      Person(name: 'B', weight: 90, height: 1.68): 'Obesidade grau I',
    };

    personList.forEach((values, expected) {
      test('Check IMC classification', () {
        expect(values.getImcMessage(), equals(expected));
      });
    });
  });

  group('Tests IMC edge cases', () {
    var personList = {
      Person(name: 'A', weight: 68, height: 2): 17,
      Person(name: 'B', weight: 71, height: 1.68): 25.15589569160998,
    };

    personList.forEach((values, expected) {
      test('Check IMC edge', () {
        expect(values.getImc(), equals(expected));
      });
    });
  });
}
