import 'package:get/get.dart';
import 'package:taxiuser/resources/routes/routename.dart';
import 'package:taxiuser/screen/ChangeLanguageScreen/change_language_screen.dart';
import 'package:taxiuser/screen/HomeScreen/HistoryScreen/history_screen.dart';
import 'package:taxiuser/screen/HomeScreen/MakeComplaintScreen/make_complaint_screen.dart';
import 'package:taxiuser/screen/HomeScreen/NotificationScreen/notification_screen.dart';
import 'package:taxiuser/screen/HomeScreen/ReferralScreen/referral_screen.dart';
import 'package:taxiuser/screen/HomeScreen/SettingScreen/setting_screen.dart';
import 'package:taxiuser/screen/HomeScreen/SosScreen/sos_screen.dart';
import 'package:taxiuser/screen/HomeScreen/SupportScreen/chat_with_us_screen.dart';
import 'package:taxiuser/screen/HomeScreen/SupportScreen/faq_screen.dart';
import 'package:taxiuser/screen/HomeScreen/SupportScreen/support_screen.dart';
import 'package:taxiuser/screen/HomeScreen/VoucherScreen/voucher_screen.dart';
import 'package:taxiuser/screen/HomeScreen/WalletScreen/card_details.dart';
import 'package:taxiuser/screen/HomeScreen/WalletScreen/wallet_screen.dart';
import 'package:taxiuser/screen/HomeScreen/home_screen.dart';
import 'package:taxiuser/screen/HomeScreen/profile_screen.dart';
import 'package:taxiuser/screen/IntroScreen/NewIntroScreen/new_introScreen.dart';
import 'package:taxiuser/screen/IntroScreen/intro_screen.dart';
import '../../screen/AuthantiCation/SelectModeOfAuth/MobileVerificationScreen/VerifiedSuccessfullyScreen.dart';
import '../../screen/AuthantiCation/SelectModeOfAuth/MobileVerificationScreen/verification_screen.dart';
import '../../screen/AuthantiCation/SelectModeOfAuth/auth_screen.dart';
import '../../screen/AuthantiCation/SelectModeOfAuth/select_mode_of_login.dart';
import '../../screen/SplashScreen/splash_screen.dart';

class route {
  static appRoute() => [
        GetPage(
            name: RouteName.splash_Screen,
            page: () => SplashScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.intro_Screen,
            page: () => IntroScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.language_change_Screen,
            page: () => ChangeLanguageScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.home_Screen,
            page: () => HomeScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.auth_Screen,
            page: () => AuthScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.profile_Screen,
            page: () => ProfileScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.history_Screen,
            page: () => HistoryScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.notification_Screen,
            page: () => NotificationScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.wallet_Screen,
            page: () => WalletScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.carddetails_screen,
            page: () => CardDetailsScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.sos_screen,
            page: () => SosScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.make_complaint_screen,
            page: () => MakeComplaintScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.setting_screen,
            page: () => SettingScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.support_screen,
            page: () => SupportScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.chatwithus_screen,
            page: () => ChatWithUsScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.faq_screen,
            page: () => FaqScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.referral_screen,
            page: () => ReferralScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.voucher_screen,
            page: () => VoucherScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.verification_screen,
            page: () => VerificationScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.continuewithmobile_screen,
            page: () => ContinueWithMobileScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.verifiedsuccess_screen,
            page: () => Verifiedsuccessfullyscreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RouteName.new_intro_screen,
            page: () => NewIntroScreen(),
            transition: Transition.rightToLeft),
      ];
}
