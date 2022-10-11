import 'package:encrypt/encrypt.dart';

class Encryption {
  final String key;
  final iv = IV.fromLength(16);

  Encryption({required this.key});

  Encrypter get _encrypter {
    final key = Key.fromUtf8(this.key);

    return Encrypter(AES(key));
  }

  String encrypt(String text) => _encrypter.encrypt(text, iv: iv).base16;

  String decrypt(String text) => _encrypter.decrypt16(text, iv: iv);
}
