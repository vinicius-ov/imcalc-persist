import 'package:hive/hive.dart';
import 'package:imcalcpersist/model/person.dart';

class PersonRepository {
  static String personBoxIdentifier = 'PersonModelBox';

  static late Box _box;

  PersonRepository._create();

  static Future<PersonRepository> carregar() async {
    if (Hive.isBoxOpen(personBoxIdentifier)) {
      _box = Hive.box(personBoxIdentifier);
    } else {
      _box = await Hive.openBox(personBoxIdentifier);
    }
    return PersonRepository._create();
  }

  add(Person personImc) {
    _box.add(personImc);
  }

  List<Person> fetchPersonImc() {
    return _box.values.cast<Person>().toList();
  }
}
