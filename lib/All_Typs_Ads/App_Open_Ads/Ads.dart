import 'package:adhar_loan/main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppOpenAdManager {
  AppOpenAd? _appOpenAd;
  static bool isLoaded = false;

  void loadAd() {
    AppOpenAd.load(
      adUnitId: ConfigData.value["AD_AppOpen"],
      orientation: AppOpenAd.orientationPortrait,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          print("Ad Loadede.................................");
          _appOpenAd = ad;
          isLoaded = true;
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  bool get isAdAvailable {
    return _appOpenAd != null;
  }


}
