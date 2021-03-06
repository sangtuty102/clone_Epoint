import 'package:clone_epoint/page/home/home_page.dart';
import 'package:clone_epoint/page/init_pgae.dart';
import 'package:clone_epoint/page/login/detail/confirm_password/confirm_pwd_page.dart';
import 'package:clone_epoint/page/login/detail/forget_password/foeget_pwd_page.dart';
import 'package:clone_epoint/page/login/detail/otp/otp_page.dart';
import 'package:clone_epoint/page/login/detail/register/register_page.dart';
import 'package:clone_epoint/page/login/login_page.dart';
import 'package:clone_epoint/page/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';

import 'base/base_theme.dart';
import 'const/const.dart';
import 'utils/utils.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light));
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: KeyBoard.hide,
      child: GetMaterialApp(
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        supportedLocales: [const Locale('vi')],
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: getThemeApp(isDarkMode: false),
        initialRoute: '/',
        getPages: route,
        logWriterCallback: (log, {bool isError}) {
          print('** ' + log + ' [' + isError.toString() + ']');
        },
      ),
    );
  }

  var route = [
    GetPage(
      name: '/',
      page: () => InitPage(),
    ),
    GetPage(
      name: AppConst.routeSplash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppConst.routeHome,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppConst.routeLogin,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppConst.routeRegister,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: AppConst.routeOTP,
      page: () => OTPPage(),
    ),
    GetPage(
      name: AppConst.routeForgetPwd,
      page: () => ForgetPwdPage(),
    ),
    GetPage(
      name: AppConst.routeConfirmPwd,
      page: () => ConfirmPwdPage(),
    ),
  ];
}

///remove effect pull scroll
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
