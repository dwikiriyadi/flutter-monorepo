import 'package:hive/hive.dart';

class Preferences {
  late Box box;

  Preferences(prefName) {
    box = Hive.box(prefName);
  }
}
