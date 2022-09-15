import 'package:permission_handler/permission_handler.dart';

class PermissionChecker {
  static Future<bool> isGranted({required List<Permission> permissions}) async {
    var response = await Future.wait(permissions.map((e) => e.isGranted));

    return response.every((element) => element == true);
  }

  static Future<bool> request({required List<Permission> permissions}) async {
    var response = await permissions.request();

    if (response.values
        .every((element) => element == PermissionStatus.granted)) {
      return true;
    }

    return false;
  }

  static Future<bool> checkAndRequest(
      {required List<Permission> permissions}) async {
    var granted = await isGranted(permissions: permissions);

    if (!granted) {
      return request(permissions: permissions);
    }

    return granted;
  }
}
