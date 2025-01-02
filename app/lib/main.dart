// ignore_for_file: depend_on_referenced_packages

import 'package:app/base_hieu/app_translations.dart';
import 'package:app/base_hieu/color_controller.dart';
import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/font_controller.dart';
import 'package:app/base_hieu/routes.dart';
import 'package:app/base_hieu/theme_controller.dart';
import 'package:app/ui/account_page/account_page.dart';
import 'package:app/ui/account_page/widget_account_page/setting_infor_page.dart';
import 'package:app/ui/home/home_page.dart';
import 'package:app/ui/lease_page/lease_page.dart';
import 'package:app/ui/post_new_page/post_new_page.dart';
import 'package:app/ui/sell_page/sell_page.dart';
import 'package:app/ui/send_required_page/send_required_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

late SharedPreferences prefs;
double? ratioHeight;
double? ratioWidth;
late double scaleFontsize;
Locale? localeL;
final logger = Logger();
int totalCurrentBtnShow = 0;

void main() async{
  // Đảm bảo nạp các file JSON trước khi chạy ứng dụng
  WidgetsFlutterBinding.ensureInitialized();
   prefs = await SharedPreferences.getInstance();
  await loadTranslations();
  await GetStorage.init();
    Get.put(ThemeController());
  Get.put(FontController());
  Get.put(ColorController());
  runApp(const MyApp());
}

Future<void> loadTranslations() async {
  // Lấy các bản dịch từ lớp AppTranslations
  AppTranslations appTranslations = AppTranslations();
  Map<String, Map<String, String>> translations = await appTranslations.loadTranslations();
  
  // Cập nhật bản dịch vào GetX
  Get.addTranslations(translations);
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
    ratioWidth = size.width / 137;
    ratioHeight = size.height / 393;
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
       translations: AppTranslations(),
      locale: Locale('vi', 'VN'), // Ngôn ngữ mặc định
      fallbackLocale: Locale('en', 'US'),
      title: 'Airdata',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 200),
     
      // initialRoute: AppRoutes.splash,
      initialRoute: AppRoutes.home,
      routingCallback: (value) async {
        if (value?.current == AppRoutes.splash) {
          await handleRatioScreen();
         
        }
      },
     getPages: [
    // Add your page routes here
    GetPage(name: AppRoutes.home, page: () => HomePage(),
    children: [
      GetPage(
        name: AppRoutes.sendRequire,
        page: () => SendRequirePage(),
        // arguments: (args) => SendRequirePage.fromArgs(args), // nếu cần
      ),
      GetPage(
        name: AppRoutes.lease,
        page: () => LeasePage(),
        // arguments: (args) => SearchModel.fromArgs(args), // nếu cần
      ),
        GetPage(
        name: AppRoutes.postNew,
        page: () => PostNewPage(),
      ),
      GetPage(
        name: AppRoutes.account,
        page: () => AccountPage(),
      ),
    ]
    ),
    GetPage(name: AppRoutes.sendRequire, page: () => SendRequirePage()),  
    GetPage(name: AppRoutes.lease, page: () => LeasePage()), 
    GetPage(name: AppRoutes.sell, page: () => SellPage()),  
    GetPage(name: AppRoutes.account, page: () => AccountPage()),  
    GetPage(name: AppRoutes.postNew, page: () => PostNewPage()),  
    GetPage(name: AppRoutes.settingInfor, page: () => SettingInforPage()),  
  ],
      theme: ThemeData(
          primarySwatch: Colors.blue,
          tabBarTheme: TabBarTheme(indicatorColor: AppColors.border),
          colorScheme: ColorScheme.light(primary: AppColors.p4C28A5),
          dividerTheme: DividerThemeData(color: AppColors.border),
          primaryColor: AppColors.p4C28A5,
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




