import 'package:bibliopolium/app/controllers/user/user_binding.dart';
import 'package:bibliopolium/app/views/user/user_page.dart';
import 'package:get/get.dart';
import 'package:bibliopolium/app/controllers/auth/auth_binding.dart';
import 'package:bibliopolium/app/controllers/auth/login/login_binding.dart';
import 'package:bibliopolium/app/controllers/auth/register/register_binding.dart';
import 'package:bibliopolium/app/controllers/home/home_binding.dart';
import 'package:bibliopolium/app/views/auth/login/login_page.dart';
import 'package:bibliopolium/app/views/auth/register/register_page.dart';
import 'package:bibliopolium/app/views/home/home_page.dart';
import 'package:bibliopolium/app/views/splash/splash_page.dart';

class Routes {
  static const splash = '/';
  static const authLogin = '/auth/login';
  static const authRegister = '/auth/register';
  static const user = '/user';
  static const home = '/home';

  static final pageList = [
    GetPage(
      name: Routes.splash,
      binding: AuthBinding(),
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.authLogin,
      binding: LoginBinding(),
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.authRegister,
      binding: RegisterBinding(),
      page: () => RegisterPage(),
    ),
    GetPage(
      name: Routes.user,
      binding: UserBinding(),
      page: () => UserPage(),
    ),
    GetPage(
      name: Routes.home,
      binding: HomeBinding(),
      page: () => HomePage(),
    ),
  ];
}
