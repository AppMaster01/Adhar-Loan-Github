import 'dart:convert';

import 'package:adhar_loan/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyAppController extends GetxController with WidgetsBindingObserver {
  bool isPaused = false;
  bool isLoaded = false;
  NativeAd? nativeAd;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(const Duration(seconds: 3), () {
      ConfigData.value != {}
          ? Get.offAndToNamed('/Get_Start')
          : initConfig().whenComplete(() {
              ConfigData.value = json.decode(remoteConfig.getString('ads'));
              print('__remoteConfig 22-> ${ConfigData.value}');
            });
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? andriod = message.notification?.android;
      if (notification != null && andriod != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    playSound: true,
                    color: Colors.blue,
                    icon: '@mipmap/ic_launcher')));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onmeseage Publish');
      RemoteNotification? notification = message.notification;
      AndroidNotification? andriod = message.notification?.android;
      if (notification != null && andriod != null) {
        var context;
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title.toString()),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.body.toString()),
                    ],
                  ),
                ),
              );
            });
      }
    });
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      AppOpenAd.load(
        adUnitId: ConfigData.value["AD_AppOpen"],
        // adUnitId: "/6499/example/app-open",
        orientation: AppOpenAd.orientationPortrait,
        request: const AdManagerAdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            print("Ad Loaded.................................");
            appOpenAd = ad;
            isLoaded = true;
          },
          onAdFailedToLoad: (error) {
            print("Ad Loaded.................................");
            // Handle the error.
          },
        ),
      );
      isPaused = true;
    }
    if (state == AppLifecycleState.resumed) {
      if (isLoaded == true) {
        appOpenAd?.show();
      }
      isPaused = false;
    }
  }
}
