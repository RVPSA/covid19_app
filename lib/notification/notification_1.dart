import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;//both these packages are inside the local notification package
                                                  // hence no need to add dependency again
import 'package:timezone/timezone.dart' as tz;

class Notification_1{
  static final _notification = FlutterLocalNotificationsPlugin(); //initialize local notification package

  //initialize notification
  static Future init({bool sheduled = false}) async{
    var initAndroidSettings = AndroidInitializationSettings('mipmap/ic_launcher');
    var ios =IOSInitializationSettings();
    final settings = InitializationSettings(android: initAndroidSettings, iOS: ios);
    tz.initializeTimeZones();
    await _notification.initialize(settings);
  }

//implementation of _notificationDetails method
    static Future _notificationDetails() async{
      return NotificationDetails(
        android: AndroidNotificationDetails(
          'channel id',
          'channel name',
          importance: Importance.max,
        ),
        iOS: IOSNotificationDetails(),
      );
    }

//implement of show notification method
  static Future<void> showNotification({
      int id=0,
      String? title,
      String? body,
      String? payload,
  }) async =>
      _notification.show(id,
          title,
          body,
          await _notificationDetails(),
          payload: payload,
      );

//shedule Notification
  static Future<void> sheduleNotification1({
    int id=0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notification.zonedSchedule(id,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        await _notificationDetails(),
        payload: payload,
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime

      );


}