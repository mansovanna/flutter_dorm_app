import 'package:get/get.dart';

import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/detail_leave/bindings/detail_leave_binding.dart';
import '../modules/detail_leave/views/detail_leave_view.dart';
import '../modules/detail_payment/bindings/detail_payment_binding.dart';
import '../modules/detail_payment/views/detail_payment_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/leave_history/bindings/leave_history_binding.dart';
import '../modules/leave_history/views/leave_history_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/payment_history/bindings/payment_history_binding.dart';
import '../modules/payment_history/views/payment_history_view.dart';
import '../modules/request_pay/bindings/request_pay_binding.dart';
import '../modules/request_pay/views/request_pay_view.dart';
import '../modules/rules/bindings/rules_binding.dart';
import '../modules/rules/views/rules_view.dart';
import '../modules/screen/bindings/screen_binding.dart';
import '../modules/screen/views/screen_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/staff/bindings/staff_binding.dart';
import '../modules/staff/views/staff_view.dart';
import '../modules/stays_history/bindings/stays_history_binding.dart';
import '../modules/stays_history/views/stays_history_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN,
      page: () => ScreenView(),
      binding: ScreenBinding(),
    ),
    GetPage(
      name: _Paths.STAYS_HISTORY,
      page: () => const StaysHistoryView(),
      binding: StaysHistoryBinding(),
    ),
    GetPage(
      name: _Paths.STAFF,
      page: () => const StaffView(),
      binding: StaffBinding(),
    ),
    GetPage(
      name: _Paths.RULES,
      page: () => const RulesView(),
      binding: RulesBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.LEAVE_HISTORY,
      page: () => LeaveHistoryView(),
      binding: LeaveHistoryBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_HISTORY,
      page: () => const PaymentHistoryView(),
      binding: PaymentHistoryBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_LEAVE,
      page: () => const DetailLeaveView(),
      binding: DetailLeaveBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PAYMENT,
      page: () => const DetailPaymentView(),
      binding: DetailPaymentBinding(),
    ),
    GetPage(
      name: _Paths.REQUEST_PAY,
      page: () => const RequestPayView(),
      binding: RequestPayBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
