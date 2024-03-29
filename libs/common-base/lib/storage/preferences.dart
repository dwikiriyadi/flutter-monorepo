import 'package:common_base/storage/hive_encryption.dart';
import 'package:hive/hive.dart';

class Preferences {
  late Box box;

  Preferences();

  Future<void> create(String prefName, String secureKey) async {
    var key = await HiveEncryption.encryptionKey(secureKey);
    box = await Hive.openBox(prefName, encryptionCipher: HiveAesCipher(key));
  }
}
