import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/routes.dart';
import 'package:app/ui/account_page/account_page.dart';
import 'package:app/ui/home/home_page.dart';
import 'package:app/ui/lease_page/lease_page.dart';
import 'package:app/ui/post_new_page/post_new_page.dart';
import 'package:app/ui/sell_page/sell_page.dart';
import 'package:app/ui/send_required_page/send_required_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

double? ratioHeight;
double? ratioWidth;
late double scaleFontsize;
Locale? localeL;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, this.locale});

    final Locale? locale;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



    Future<void> handleRatioScreen() async {
    var size = Get.size;
    ratioWidth = size.width / 374;
    ratioHeight = size.height / 812;
    scaleFontsize = math.min(ratioWidth!, ratioHeight!);
    if (scaleFontsize >= 1) {
      scaleFontsize = 1;
    } else {
      scaleFontsize = 0.85;
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Airdata',
      // navigatorKey: HttpInspector.instance.alice.getNavigatorKey(),
      debugShowCheckedModeBanner: false,
      locale: localeL,

      // fallbackLocale: const Locale('vi', 'VN'),
      // locale: getLanguageWithDevice(),

      // supportedLocales: S.delegate.supportedLocales,

      // navigatorObservers: [MyObserver()],
      defaultTransition: Transition.rightToLeftWithFade,
      // customTransition: TransitionApp(), fallbackLocale: localeL,
      transitionDuration: const Duration(milliseconds: 200),
      localizationsDelegates: const [
        // S.delegate,
        // GlobalCupertinoLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // DefaultCupertinoLocalizations.delegate
      ],
      // initialRoute: AppRoutes.splash,
      initialRoute: AppRoutes.home,
      routingCallback: (value) async {
        if (value?.current == AppRoutes.splash) {
          await handleRatioScreen();
          // await checkToken();
          // if (isFirstRun) {
          //   navigatorOffAllWithRouteName(routeName: AppRoutes.startedPage);
          // } else if (isLogged) {
          //   navigatorOffAllWithRouteName(routeName: AppRoutes.home);
          // } else {
          //   navigatorOffAllWithRouteName(routeName: AppRoutes.login);
          // }

          // if (isLogged) {
          //   navigatorOffAllWithRouteName(routeName: AppRoutes.home);
          // } else {
          //   navigatorOffAllWithRouteName(routeName: AppRoutes.login);
          // }

          // final appVersion = await getVersionConfig();

          // if (appVersion != null) {
          //   _progressUpgrade(appVersion);
          // }
        }
      },
     getPages: [
    // Add your page routes here
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.sendRequire, page: () => SendRequirePage()),  // Add corresponding page for sendRequire route
    GetPage(name: AppRoutes.lease, page: () => LeasePage()),  // Add corresponding page for lease route
    GetPage(name: AppRoutes.sell, page: () => SellPage()),  // Add corresponding page for sell route
    GetPage(name: AppRoutes.account, page: () => AccountPage()),  // Add corresponding page for account route
    GetPage(name: AppRoutes.postNew, page: () => PostNewPage()),  // Add corresponding page for postNew route
  ],
      theme: ThemeData(
          primarySwatch: Colors.blue,
          tabBarTheme: TabBarTheme(indicatorColor: AppColors.border),
          colorScheme: ColorScheme.light(primary: AppColors.active),
          dividerTheme: DividerThemeData(color: AppColors.border),
          primaryColor: AppColors.active,
          dividerColor: AppColors.border,
          datePickerTheme:
              DatePickerThemeData(backgroundColor: Colors.white, elevation: 0),
          dialogTheme: DialogTheme(backgroundColor: Colors.white, elevation: 0),
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: Colors.white, elevation: 0),
          indicatorColor: AppColors.blueGradient,
          fontFamily: "Lato-Medium"),
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        // return 
        //  FloatingNotificationWidget(
        //   child: MediaQuery(
        //     data: data.copyWith(textScaler: TextScaler.linear(1)),
        //     child: child!,
        //   ),
        // );
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
    );
  }
}




