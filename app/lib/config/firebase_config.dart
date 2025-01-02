import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:chotbds/src/router/app_router.dart';
// import 'package:chotbds/src/router/name_router.dart';
// import 'package:chotbds/utils/common.dart';
// import '../screen/notification/message_screen.dart';
// import '../../network/auth_apis.dart';

class FirebaseConfig {
  //initialising firebase message plugin
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  //initialising firebase message plugin
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  //function to initialise flutter local notification plugin to show notifications for android when app is active
  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
      // handle interaction when app is active for android
      handleMessage(context, message);
    });
  }

  void firebaseInit(BuildContext context) async {
    // Thêm log để debug
    String? token = await messaging.getToken();
    print("Firebase Token: $token");

    // Kiểm tra trạng thái đăng ký
    NotificationSettings settings = await messaging.getNotificationSettings();
    print("Authorization Status: ${settings.authorizationStatus}");
    print("Alert Setting: ${settings.alert}");
    print("Sound Setting: ${settings.sound}");
    print("Badge Setting: ${settings.badge}");

    if (Platform.isIOS) {
      print("Initializing iOS notifications");
      var apnsToken = await messaging.getAPNSToken();
      print("APNS Token: $apnsToken");
      await foregroundMessage();
    }

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((message) {
      print("onMessage received: ${message.notification?.title}");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (kDebugMode) {
        print("notifications title:${notification?.title}");
        print("notifications body:${notification?.body}");
        print('count:${android?.count}');
        print('data:${message.data.toString()}');
      }

      if (Platform.isIOS) {
        foregroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotification(message);
      }

      if (notification?.title != null) {
        if (notification!.title == "Change Pass") {
          // logoutUser();
          // todo: update khi handle api
          // ShowToastError("Tài khoản bạn đã thay đổi mật khẩu");
          // AppRouter.clearStackAndNavigate(NameRouter.login.path);
          return;
        }

        if (notification.title == "Logouted") {
          // logoutUser();
          // todo: update khi handle api
          // ShowToastError("Tài khoản của bạn đã đăng nhập trên thiết bị khác");
          // AppRouter.clearStackAndNavigate(NameRouter.login.path);
          return;
        }
      }
    });

    // Listen for background/terminated messages
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("onMessageOpenedApp received: ${message.notification?.title}");
      print("Message data: ${message.data}");
      handleMessage(context, message);
    });

    // Check for initial message (app opened from terminated state)
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print("Initial message received: ${message.notification?.title}");
        handleMessage(context, message);
      }
    });
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
    } else {
      //appsetting.AppSettings.openNotificationSettings();
      if (kDebugMode) {
        print('user denied permission');
      }
    }
  }

  // function to show visible notification when app is active
  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        message.notification!.android!.channelId.toString(),
        message.notification!.android!.channelId.toString(),
        importance: Importance.max,
        showBadge: true,
        playSound: true,
        sound: const RawResourceAndroidNotificationSound('jetsons_doorbell'));

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: 'your channel description',
            importance: Importance.high,
            priority: Priority.high,
            playSound: true,
            ticker: 'ticker',
            sound: channel.sound
            //     sound: RawResourceAndroidNotificationSound('jetsons_doorbell')
            //  icon: largeIconPath
            );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        message.hashCode, // Unique ID for the notification
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
  }

  //function to get device token on which we will send the notifications
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      if (kDebugMode) {
        print('refresh');
      }
    });
  }

  //handle tap on notification when app is in background or terminated
  Future<void> setupInteractMessage(BuildContext context) async {
    // when app is terminated
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    //when app ins background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
      print('Received foreground message:');
      print('Title: ${event.notification?.title}');
      print('Body: ${event.notification?.body}');
      print('Data: ${event.data}');
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    print("Handling message: ${message.notification?.title}");
    print("Message data: ${message.data}");

    // Thêm logic xử lý message tùy theo data
    if (message.data['type'] != null) {
      switch (message.data['type']) {
        case 'msj':
          // todo: update khi handle api
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => MessageScreen(id: message.data['id']),
          //   ),
          // );
          break;
        // Thêm các case khác tùy theo loại notification
        default:
          print("Unknown message type: ${message.data['type']}");
      }
    }
  }

  Future<void> foregroundMessage() async {
    print("Setting foreground notification options");
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
