import 'package:firebase_messaging/firebase_messaging.dart';

abstract class NotificationHandler {
  initialMessage(RemoteMessage? message);

  onMessage(RemoteMessage? message);

  onMessageOpenedApp(RemoteMessage? message);
}
