import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class HiveEncryption {
  static Future<Uint8List> encryptionKey(String secureKey) async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();

    var containsEncryptionKey =
    await secureStorage.containsKey(key: secureKey);

    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(
          key: secureKey, value: base64UrlEncode(key));
    }

    var key = await secureStorage.read(key: secureKey);

    return base64Url.decode(key!);
  }
}
