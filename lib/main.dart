import 'dart:convert';

import 'package:adhar_loan/Screen/GetStartScreen/Get_Start.dart';
import 'package:adhar_loan/Splash_Screen/Splash.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Screen/Aadhar Loan Guide/Aadhar Loan Guide.dart';
import 'Screen/Aadhar_Pan_Link/link_to_adhar/Adhar_Pan_Link.dart';
import 'Screen/Aadhar_Pan_Link/Adhara_Link_Show_Details.dart';
import 'Screen/Aadhar_Pan_Link/Important/answer.dart';
import 'Screen/Aadhar_Pan_Link/link_to_adhar/data.dart';
import 'Screen/Addres_Change/first/Addres_Change.dart';
import 'Screen/Addres_Change/secon_detail/Adhar_Change_details.dart';
import 'Screen/Adhar_Guide_Deails_Page/first/Adhar_Guide.dart';
import 'Screen/Adhar_Guide_Deails_Page/second_detail/Detail.dart';
import 'Screen/Bank_Info/first/firebase_json_bank_name.dart';
import 'Screen/Bank_Info/second/bank_Deattil.dart';
import 'Screen/Bank_holiday/Bank_Holiday/holidays.dart';
import 'Screen/Bank_holiday/Bank_holiday_Detail/holidays_detail.dart';
import 'Screen/EPF_Sevice/EPF_Details_page/Details_Model/Claim/Claim_Show_Details.dart';
import 'Screen/EPF_Sevice/EPF_Details_page/Details_Model/EPF/EPF_List_view.dart';
import 'Screen/EPF_Sevice/EPF_Details_page/Show_Detail.dart';
import 'Screen/EPF_Sevice/first/EPF.dart';
import 'Screen/Near_By_Me/near_By_Me.dart';
import 'Screen/Types_Of_Loan/loan_type/Loan_Types.dart';
import 'Screen/Types_Of_Loan/loan_type_details/loan_type.dart';
import 'in_App_View/Privacy.dart';

final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
RxMap ConfigData = {}.obs;

Future initConfig() async {
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 1),
    minimumFetchInterval: const Duration(seconds: 10),
  ));
  await remoteConfig.fetchAndActivate();
}

AppOpenAd? appOpenAd;

loadAd() {
  AppOpenAd.load(
    adUnitId: ConfigData.value['AD_AppOpen'],
    orientation: AppOpenAd.orientationPortrait,
    request: const AdManagerAdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        print("Ad Loadede.................................");
        appOpenAd = ad;
        // isLoaded=true;
        ad.show();
      },
      onAdFailedToLoad: (error) {
        // loadAd();
        AppOpenAd.load(
          adUnitId: ConfigData.value['AD_AppOpen'],
          orientation: AppOpenAd.orientationPortrait,
          request: const AdManagerAdRequest(),
          adLoadCallback: AppOpenAdLoadCallback(
            onAdLoaded: (ad) {
              print("Ad Loadede.................................");
              appOpenAd = ad;
              // isLoaded=true;
              ad.show();
            },
            onAdFailedToLoad: (error) {
              // loadAd();
              // Handle the error.
            },
          ),
        );

        // Handle the error.
      },
    ),
  );
}

AndroidNotificationChannel channel = AndroidNotificationChannel(
    "Hello ", "Rohan",
    playSound: true, importance: Importance.high);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  initConfig().whenComplete(() {
    ConfigData.value = json.decode(remoteConfig.getString('ads'));
    loadAd();
    print('__remoteConfig -> ${ConfigData.value}');
  });
  FacebookAudienceNetwork.init();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Splash_Screen(),
      '/Get_Start': (context) => Get_Start(),
      '/Aadhar_Loan_Guide': (context) => Aadhar_Loan_Guide(),
      '/Adhar_guide': (context) => Adhar_guide(),
      '/Adhar_guide_Details': (context) => Adhar_guide_Details(),
      '/Loan_Types': (context) => Loan_Types(),
      '/Loan_details': (context) => Loan_details(),
      '/Address_Change': (context) => Address_Change(),
      '/Adhar_Change_Details': (context) => Adhar_Change_Details(),
      '/EPF_Service': (context) => EPF_Service(),
      '/Show_Details': (context) => Show_Details(),
      '/Claim_Details': (context) => Claim_Details(),
      '/EPF_Online_Detail': (context) => EPF_Online_Detail(),
      '/Adhar_Pan_Link': (context) => Adhar_Pan_Link(),
      '/Adhar_Show_Details': (context) => Adhar_Show_Details(),
      '/inportent': (context) => inportent(),
      '/Link_To_Adhar': (context) => Link_To_Adhar(),
      '/Bank_Details': (context) => Bank_Details(),
      '/Bank_Service': (context) => Bank_Service(),
      '/Bank_Holiday': (context) => Bank_Holiday(),
      '/Bank_holiday_Detail': (context) => Bank_holiday_Detail(),
      '/Near_By_Me': (context) => Near_By_Me(),
      '/In_App_Privacy': (context) => In_App_Privacy(),
    },
    // home: Splash_Screen(),
  ));
}
