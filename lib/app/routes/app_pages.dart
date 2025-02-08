import 'package:get/get.dart';

import '../modules/ForgotPasswordScreen/bindings/forgot_password_screen_binding.dart';
import '../modules/ForgotPasswordScreen/views/forgot_password_screen_view.dart';
import '../modules/LoginScreen/bindings/login_screen_binding.dart';
import '../modules/LoginScreen/views/login_screen_view.dart';
import '../modules/MyNavbarScreen/bindings/my_navbar_screen_binding.dart';
import '../modules/MyNavbarScreen/views/my_navbar_screen_view.dart';

import '../modules/OTPVerifyScreen/bindings/o_t_p_verify_screen_binding.dart';
import '../modules/OTPVerifyScreen/views/o_t_p_verify_screen_view.dart';
import '../modules/OnboardingScreen/bindings/onboarding_screen_binding.dart';
import '../modules/OnboardingScreen/views/onboarding_screen_view.dart';
import '../modules/ProfileRegisterScreen/bindings/profile_register_screen_binding.dart';
import '../modules/ProfileRegisterScreen/views/profile_register_screen_view.dart';
import '../modules/ProfileScreen/bindings/profile_screen_binding.dart';
import '../modules/ProfileScreen/views/profile_screen_view.dart';
import '../modules/RegisterScreen/bindings/register_screen_binding.dart';
import '../modules/RegisterScreen/views/register_screen_view.dart';
import '../modules/ResetPasswordScreen/bindings/reset_password_screen_binding.dart';
import '../modules/ResetPasswordScreen/views/reset_password_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_SCREEN,
      page: () => RegisterScreenView(),
      binding: RegisterScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_REGISTER_SCREEN,
      page: () => ProfileRegisterScreenView(),
      binding: ProfileRegisterScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_SCREEN,
      page: () => OnboardingScreenView(),
      binding: OnboardingScreenBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_SCREEN,
      page: () => ForgotPasswordScreenView(),
      binding: ForgotPasswordScreenBinding(),
    ),

    GetPage(
      name: _Paths.RESET_PASSWORD_SCREEN,
      page: () => ResetPasswordScreenView(),
      binding: ResetPasswordScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_NAVBAR_SCREEN,
      page: () => const MyNavbarScreenView(),
      binding: MyNavbarScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SCREEN,
      page: () => ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.O_T_P_VERIFY_SCREEN,
      page: () =>   OTPVerifyScreenView(),
      binding: OTPVerifyScreenBinding(),
    ),
  ];
}
