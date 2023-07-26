import 'dart:developer';

import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Media_Qury/Media_Qury.dart';
import '../../main.dart';

// final AddButton addButton = Get.put(AddButton());

final TapController tapController = Get.put(TapController());
final BackTapController backtapController = Get.put(BackTapController());

class TapController extends GetxController {
  Future<void> _launchURL(String url) async {
    late Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Rx buttoncounter = 1.obs;

  tapbutton(
      BuildContext context, String page, String name, var aa, var anima) async {
    if (ConfigData.value["Counter"] == buttoncounter.value) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Center(
              child: AlertDialog(
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: ScreenSize.pSize_30(),
                        height: ScreenSize.pSize_30(),
                        child: const CircularProgressIndicator()),
                    const Text("Ad is loading..."),
                  ],
                ),
              ),
            ),
          );
        },
      );
      if (ConfigData.value[name]["AD_Interstitial_TYPE"] == 'admob') {
        InterstitialAd.load(
          adUnitId: ConfigData.value[name]["ADMOB_Interstitial"],
          // adUnitId: "/6499/example/interstitial",
          request: const AdManagerAdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
            ad.show();
            Navigator.pop(context);
            page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
            buttoncounter.value = 1;
          }, onAdFailedToLoad: (error) {
            InterstitialAd.load(
              adUnitId: ConfigData.value["AD_Interstitial"],
              // adUnitId: "/6499/example/interstitial",
              request: const AdManagerAdRequest(),
              adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
                ad.show();
                Navigator.pop(context);
                page != 'stop' ? Get.toNamed(name, arguments: aa) : null;
                buttoncounter.value = 1;
              }, onAdFailedToLoad: (error) {
                Navigator.pop(context);
                page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
                buttoncounter.value = 1;
              }),
            );
          }),
        );
      }

      if (ConfigData.value[name]["AD_Interstitial_TYPE"] == 'fb') {
        FacebookInterstitialAd.loadInterstitialAd(
          placementId: ConfigData.value["AD_Interstitial_FB"],
          // placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
          listener: (result, value) {
            if (result == InterstitialAdResult.LOADED) {
              FacebookInterstitialAd.showInterstitialAd;
              Navigator.pop(context);
              page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
              buttoncounter.value = 1;
            }
            if (result == InterstitialAdResult.ERROR) {
              Navigator.pop(context);
              page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
              buttoncounter.value = 1;
            }
          },
        );
      }
      if (ConfigData.value[name]["AD_Interstitial_TYPE"] == "Url") {
        _launchURL(ConfigData.value[name]["Link"]);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pop(context);
            page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
            buttoncounter.value = 1;
          },
        );
      }
    } else {
      // Get.to(() => const FirstPage());
      page != 'stop' ? Get.toNamed(page, arguments: aa) : null;
      buttoncounter.value++;
      // controller.incrementClickCount(context, 'FirstPage');
    }
  }
}
//=========================================================================================================

class BackTapController extends GetxController {
  Future<void> _launchURL(String url) async {
    late Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Rx buttoncounter = 1.obs;

  backtapbutton(
      BuildContext context, String page, String name, var anima) async {
    if (ConfigData.value["BackCounter"] == buttoncounter.value) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Center(
              child: AlertDialog(
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: ScreenSize.pSize_30(),
                        height: ScreenSize.pSize_30(),
                        child: const CircularProgressIndicator()),
                    const Text("Ad is loading..."),
                  ],
                ),
              ),
            ),
          );
        },
      );
      if (ConfigData.value[name]["AD_Interstitial_TYPE"] == 'admob') {
        InterstitialAd.load(
          adUnitId: ConfigData.value[name]["ADMOB_Interstitial"],
          // adUnitId: "/6499/example/interstitial",
          request: const AdManagerAdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
            ad.show();
            Navigator.pop(context);
            page != 'stop' ? Navigator.pop(context) : null;
            buttoncounter.value = 1;
          }, onAdFailedToLoad: (error) {
            InterstitialAd.load(
              adUnitId: ConfigData.value["AD_Interstitial"],
              // adUnitId: "/6499/example/interstitial",
              request: const AdManagerAdRequest(),
              adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
                ad.show();
                Navigator.pop(context);
                page != 'stop' ? Navigator.pop(context) : null;
                buttoncounter.value = 1;
              }, onAdFailedToLoad: (error) {
                Navigator.pop(context);
                page != 'stop' ? Navigator.pop(context) : null;
                buttoncounter.value = 1;
              }),
            );
          }),
        );
      }

      if (ConfigData.value[name]["AD_Interstitial_TYPE"] == 'fb') {
        FacebookInterstitialAd.loadInterstitialAd(
          // placementId: ConfigData.value["AD_Interstitial_FB"],
          placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
          listener: (result, value) {
            if (result == InterstitialAdResult.LOADED) {
              FacebookInterstitialAd.showInterstitialAd;
              Navigator.pop(context);
              page != 'stop' ? Navigator.pop(context) : null;
              buttoncounter.value = 1;
            }
            if (result == InterstitialAdResult.ERROR) {
              Navigator.pop(context);
              page != 'stop' ? Navigator.pop(context) : null;
              buttoncounter.value = 1;
            }
          },
        );
      }
      if (ConfigData.value[name]["AD_Interstitial_TYPE"] == "Url") {
        _launchURL(ConfigData.value[name]["Link"]);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pop(context);
            page != 'stop' ? Navigator.pop(context) : null;
            buttoncounter.value = 1;
          },
        );
      }
    } else {
      // Get.to(() => const FirstPage());
      page != 'stop' ? Navigator.pop(context) : null;
      buttoncounter.value++;
      // controller.incrementClickCount(context, 'FirstPage');
    }
  }
}
