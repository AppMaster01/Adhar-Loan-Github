// // ignore_for_file: invalid_use_of_protected_member
//
// import 'package:facebook_audience_network/facebook_audience_network.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../Media_Qury/Media_Qury.dart';
// import '../../main.dart';
//
// final native = Get.put(NativeAds());
// final banner = Get.put(BannerAds());
//
//
//
// class NativeAds extends GetxController {
//   Future<void> _launchURL(String url) async {
//     late Uri uri = Uri(scheme: "https", host: url);
//     if (!await launchUrl(
//       uri,
//       mode: LaunchMode.externalApplication,
//     )) {
//       throw "Can not launch url";
//     }
//   }
//
//   Widget getNT() {
//     late NativeAd nativeAd;
//     var isLoaded = false.obs;
//     if (Config.value["Native_Ad_type"] == "Admob") {
//       nativeAd = NativeAd(
//         request: const AdManagerAdRequest(),
//         adUnitId: Config.value["Native_Admob"],
//         listener: NativeAdListener(onAdLoaded: (ad) {
//           nativeAd.load();
//           isLoaded.value = true;
//           print("Banner ad Loaded");
//         }, onAdFailedToLoad: (ad, error) {
//           print("Banner ad Failed to Load");
//         }),
//         factoryId: 'listTileMedium',
//       );
//       nativeAd.load();
//     }
//
//     return Config.value["Native_Ad_type"] == "Admob"
//         ? Obx(() => isLoaded.value
//             ? Stack(
//                 children: [
//                   Container(
//                     width: ScreenSize.pSize_340(),
//                     height: ScreenSize.pSize_250(),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 4,
//                         )
//                       ],
//                     ),
//                     child: AdWidget(
//                       ad: nativeAd,
//                     ),
//                     // color: Colors.blue,
//                   ),
//                   Positioned(
//                     top: 5,
//                     left: 5,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.circular(5)),
//                       height: ScreenSize.pSize_15(),
//                       width: ScreenSize.pSize_25(),
//                       child: Center(
//                         child: Text('Ad',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: ScreenSize.pSize_10())),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             : Container(
//                 width: ScreenSize.pSize_350(),
//                 height: ScreenSize.pSize_250(),
//                 child: const Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               ))
//         : Config.value["Native_Ad_type"] == "Fb"
//             ? Container(
//                 width: ScreenSize.pSize_350(),
//                 height: ScreenSize.pSize_250(),
//                 child: Container(
//                   width: ScreenSize.pSize_350(),
//                   height: ScreenSize.pSize_250(),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 4,
//                       )
//                     ],
//                   ),
//                   child: FacebookNativeAd(
//                     placementId: Config.value["Native_FB"],
//                     adType: NativeAdType.NATIVE_AD,
//                     width: ScreenSize.pSize_350(),
//                     height: ScreenSize.pSize_250(),
//                     backgroundColor: Colors.white,
//                     titleColor: Colors.black,
//                     descriptionColor: Colors.grey,
//                     buttonColor: Colors.lightBlue[100],
//                     buttonTitleColor: Colors.blue,
//                     buttonBorderColor: Colors.lightBlue[100],
//                     listener: (result, value) {
//                       print("Native Ad: $result --> $value");
//                     },
//                     keepExpandedWhileLoading: true,
//                     expandAnimationDuraion: 1000,
//                   ),
//                 ),
//               )
//             : GestureDetector(
//                 onTap: () {
//                   _launchURL(Config.value["Url"]);
//                 },
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: ScreenSize.pSize_340(),
//                       height: ScreenSize.pSize_250(),
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image:
//                                 NetworkImage(Config.value["Image_Url"]),
//                             fit: BoxFit.fill),
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.black26,
//                             blurRadius: 4,
//                           )
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       top: 5,
//                       left: 5,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.green,
//                             borderRadius: BorderRadius.circular(5)),
//                         height: ScreenSize.pSize_15(),
//                         width: ScreenSize.pSize_25(),
//                         child: Center(
//                           child: Text('Ad',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: ScreenSize.pSize_10())),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//   }
// }
//
// //======================================FACEBOOK BANNER===================================================
//
// class BannerAds extends GetxController {
//   BannerAd? bannerAd;
//   var bannerLoaded = false.obs;
//
//   Widget getBN() {
//     bannerAd = BannerAd(
//       size: AdSize.fluid,
//       // adUnitId: "ca-app-pub-3940256099942544/6300978111",
//       adUnitId: Config.value["Banner_Admob"],
//       listener: BannerAdListener(
//           onAdLoaded: (ad) {
//             bannerAd!.load();
//             bannerLoaded.value = true;
//             print("Banner ad Loaded");
//           },
//           onAdFailedToLoad: (ad, error) {}),
//       request: const AdRequest(),
//     );
//     bannerAd!.load();
//     // bannerLoaded.value = true;
//
//     return Config.value["Banner_Ad_type"] == "Admob"
//         ? SizedBox(
//             height: 50,
//             child: AdWidget(
//               ad: bannerAd!,
//             ),
//           )
//         : Container(
//             height: 50,
//             child: FacebookBannerAd(
//               placementId: Config.value["Banner_FB"],
//               bannerSize: BannerSize.STANDARD,
//               listener: (result, value) {},
//             ),
//           );
//   }
// }
// ignore_for_file: invalid_use_of_protected_member

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Media_Qury/Media_Qury.dart';
import '../../main.dart';

final native = Get.put(NativeAds());
final banner = Get.put(BA());

void initState() {
  FacebookAudienceNetwork.init();
}

class NativeAds extends GetxController {
  Future<void> _launchURL(String url) async {
    late Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Widget getNT(String name) {
    print('Get.currentRoute${name}');
    late NativeAd nativeAd;
    var isLoaded = false.obs;
    if (ConfigData.value[name]["AD_Native_TYPE"] == "admob") {
      nativeAd = NativeAd(
        request: const AdManagerAdRequest(),
        adUnitId: ConfigData.value[name]["ADMOB_Native"],
        listener: NativeAdListener(onAdLoaded: (ad) {
          nativeAd.load();
          isLoaded.value = true;
          print("Banner ad Loaded");
        }, onAdFailedToLoad: (ad, error) {
          print("Banner ad Failed to Load");
        }),
        factoryId: 'listTileMedium',
      );
      nativeAd.load();
    }

    return ConfigData.value[name]["AD_Native_TYPE"] == "admob"
        ? Obx(() => isLoaded.value
            ? Stack(
                children: [
                  Container(
                    width: ScreenSize.pSize_340(),
                    height: ScreenSize.horizontalBlockSize! * 72,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: AdWidget(
                      ad: nativeAd,
                    ),
                    // color: Colors.blue,
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 194, 255, 1),
                          borderRadius: BorderRadius.circular(5)),
                      height: ScreenSize.pSize_15(),
                      width: ScreenSize.pSize_25(),
                      child: Center(
                        child: Text('Ad',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenSize.pSize_10())),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                width: ScreenSize.pSize_350(),
                height: ScreenSize.pSize_250(),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ))
        : ConfigData.value[name]["AD_Native_TYPE"] == "fb"
            ? Container(
                width: ScreenSize.pSize_350(),
                height: ScreenSize.pSize_250(),
                child: Container(
                  width: ScreenSize.pSize_350(),
                  height: ScreenSize.pSize_250(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                      )
                    ],
                  ),
                  child: FacebookNativeAd(
                    placementId: ConfigData.value["AD_Native_FB"],
                    adType: NativeAdType.NATIVE_AD,
                    width: ScreenSize.pSize_350(),
                    height: ScreenSize.pSize_250(),
                    backgroundColor: Colors.white,
                    titleColor: Colors.black,
                    descriptionColor: Colors.grey,
                    buttonColor: Color.fromRGBO(98, 104, 208, 1),
                    buttonTitleColor: Colors.white,
                    listener: (result, value) {
                      print("Native Ad: $result --> $value");
                    },
                    keepExpandedWhileLoading: true,
                    expandAnimationDuraion: 1000,
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  _launchURL(ConfigData.value["Link"]);
                },
                child: Stack(
                  children: [
                    Container(
                      width: ScreenSize.pSize_340(),
                      height: ScreenSize.pSize_250(),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                ConfigData.value[name]["Image_Url"]),
                            fit: BoxFit.fill),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 5,
                      left: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 194, 255, 1),
                            borderRadius: BorderRadius.circular(5)),
                        height: ScreenSize.pSize_15(),
                        width: ScreenSize.pSize_25(),
                        child: Center(
                          child: Text('Ad',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenSize.pSize_10())),
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}
//===========================================================================

class BA extends GetxController {
  BannerAd? bannerAd;
  var bannerLoaded = false.obs;

  Widget BANNER(String Pagename) {
    if(ConfigData.value[Pagename]["AD_Banner_TYPE"] == "admob"){
      bannerAd = BannerAd(
        size: AdSize.fluid,
        adUnitId: ConfigData.value[Pagename]["ADMOB_Banner"],
        listener: BannerAdListener(
            onAdLoaded: (ad) {
              bannerAd!.load();
              bannerLoaded.value = true;
              print("Banner ad Loaded");
            },
            onAdFailedToLoad: (ad, error) {}),
        request: const AdRequest(),
      );
      bannerAd!.load();
    }

    // bannerLoaded.value = true;

    return ConfigData.value[Pagename]["AD_Banner_TYPE"] == "admob"
        ? Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              color: Colors.black,
              child: AdWidget(
                ad: bannerAd!,
              ),
            ),
          )
        : Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              child: FacebookBannerAd(
                placementId: ConfigData.value["AD_Banner_FB"],
                bannerSize: BannerSize.STANDARD,
                listener: (result, value) {},
              ),
            ),
          );
  }
}
