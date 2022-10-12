import 'package:google_mobile_ads/google_mobile_ads.dart';

BannerAd? bannerAd;
InterstitialAd? interstitialVideoAd;

void bannerAds(){
  bannerAd = BannerAd(
    size:AdSize.banner,
    adUnitId: "ca-app-pub-3940256099942544/6300978111",
    listener: BannerAdListener(),
    request: AdRequest(),

  );
  bannerAd!.load();
}

void interVideoAds(){
  InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/8691691433",
      request: AdRequest(),
      adLoadCallback:  InterstitialAdLoadCallback(onAdLoaded: (ad){
        interstitialVideoAd = ad;
      },
          onAdFailedToLoad:(error){}
      )
  );
}
