
import 'package:app/base/urls.dart';

enum Flavor { DEV, STAGING, PRODUCTION }

class AppConfig {
  final String name;
  final bool log;
  final String baseAuthzApi;
  final String baseCMSApi;
  final String basePromoApi;
  final String baseNotiApi;
  final String signUpUrl;
  final Flavor flavor;

  const AppConfig({
    required this.name,
    required this.log,
    required this.flavor,
    required this.baseAuthzApi,
    required this.baseCMSApi,
    required this.basePromoApi,
    required this.baseNotiApi,
    required this.signUpUrl,
  });
  static AppConfig? _instance;

  static AppConfig get instance => _instance!;

  factory AppConfig.fromFlavor(
      {Flavor flavor = Flavor.DEV, bool isMiniApp = false}) {
    if (_instance != null) return _instance!;
    switch (flavor) {
      case Flavor.DEV:
        _instance = const AppConfig(
            name: 'DEV',
            log: true,
            baseAuthzApi: 'https://',
            baseCMSApi: 'https://',
            basePromoApi: 'https://',
            baseNotiApi: 'https://',
            signUpUrl: 'https://',
            flavor: Flavor.DEV);
        break;
      case Flavor.STAGING:
        _instance = const AppConfig(
            name: 'STAGING',
            log: true,
            baseAuthzApi: AppUrls.baseStagAuthUrl,
            baseCMSApi: AppUrls.baseStagCMSUrl,
            basePromoApi: AppUrls.baseStagPromotionUrl,
            baseNotiApi: AppUrls.baseStagNotiUrl,
            signUpUrl: 'https://stg.airdata.site/register',
            flavor: Flavor.STAGING);
        break;
      case Flavor.PRODUCTION:
        _instance = const AppConfig(
          name: 'PRODUCTION',
          log: false,
          baseAuthzApi: 'https://',
          baseCMSApi: 'https://',
          basePromoApi: 'https://',
          baseNotiApi: 'https://',
          signUpUrl: 'https://',
          flavor: Flavor.PRODUCTION,
        );
        break;
      default:
        _instance = const AppConfig(
          name: 'PRODUCTION',
          log: false,
          baseAuthzApi: 'https://',
          baseCMSApi: 'https://',
          basePromoApi: 'https://',
          baseNotiApi: 'https://',
          signUpUrl: 'https://',
          flavor: Flavor.PRODUCTION,
        );
    }
    return _instance!;
  }
}
