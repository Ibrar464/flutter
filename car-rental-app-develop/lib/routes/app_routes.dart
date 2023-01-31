import 'package:car_rental_app/presentation/aboutUs/about_us_screen.dart';
import 'package:car_rental_app/presentation/address/address_screen.dart';
import 'package:car_rental_app/presentation/admin/dashboard/dashboard.dart';
import 'package:car_rental_app/presentation/auth/changePassword/change_password.dart';
import 'package:car_rental_app/presentation/auth/createNewPassword/create_new_password.dart';
import 'package:car_rental_app/presentation/auth/forgotPassword/forgot_password.dart';
import 'package:car_rental_app/presentation/auth/login/login_screen.dart';
import 'package:car_rental_app/presentation/auth/otpScreen/otp_screen.dart';
import 'package:car_rental_app/presentation/auth/signUp/sign_up.dart';
import 'package:car_rental_app/presentation/auth/wellcomeSlider/wellcome_screen.dart';
import 'package:car_rental_app/presentation/availableCars/available_cars_screen.dart';
import 'package:car_rental_app/presentation/bottomBar/bottombar_screen.dart';
import 'package:car_rental_app/presentation/chat/chat_list.dart';
import 'package:car_rental_app/presentation/chat/chat_screen.dart';
import 'package:car_rental_app/presentation/checkList/checkoutlist_screen.dart';
import 'package:car_rental_app/presentation/checkout/checkout_screen.dart';
import 'package:car_rental_app/presentation/details/details_screen.dart';
import 'package:car_rental_app/presentation/discover/discover_screen.dart';
import 'package:car_rental_app/presentation/editProfile/edit_profile_screen.dart';
import 'package:car_rental_app/presentation/filters/filters_screen.dart';
import 'package:car_rental_app/presentation/language/language.dart';
import 'package:car_rental_app/presentation/notificationList/notification_list_screen.dart';
import 'package:car_rental_app/presentation/paymentMethod/payment_method_screen.dart';
import 'package:car_rental_app/presentation/privacyPolicy/privacy_policy_screen.dart';
import 'package:car_rental_app/presentation/rideDetails/ride_details_screen.dart';
import 'package:car_rental_app/presentation/rideHistory/ride_history_screen.dart';
import 'package:car_rental_app/presentation/ridecarDetails/ridecar_detail_screen.dart';
import 'package:car_rental_app/presentation/search/search_screen.dart';
import 'package:car_rental_app/presentation/seeAll/see_all_screen.dart';
import 'package:car_rental_app/presentation/setting/setting.dart';
import 'package:car_rental_app/presentation/t_c/terms_condition_screen.dart';
import 'package:car_rental_app/presentation/thankyou/thankyou_screen.dart';
import 'package:car_rental_app/presentation/trackYourRide/track_your_ride_screen.dart';
import 'package:get/get.dart';

import '../presentation/admin/dashboard/add_car.dart';
import '../presentation/admin/dashboard/update_car.dart';
import '../presentation/top_admin/top_admin_screen.dart';

class AppRoutes {
  static String dashboardScreen = '/dashboardScreen';
  static String addCarScreen = '/addCarScreen';
  static String chatListScreen = '/chatListScreen';
  static String discoverScreen = '/discoverScreen';
  static String seeAllScreen = '/seeAllScreen';
  static String detailsScreen = '/detailsScreen';
  static String availableCarsScreen = '/availableCarsScreen';
  static String bottomBarScreen = '/bottomBarScreen';
  static String editProfileScreen = '/editProfileScreen';
  static String paymentMethodScreen = '/paymentMethodScreen';
  static String checkoutScreen = '/checkoutScreen';
  static String checkoutListScreen = '/checkoutListScreen';
  static String addressScreen = '/addressScreen';
  static String rideHistoryScreen = '/rideHistoryScreen';
  static String rideDetailsScreen = '/rideDetailsScreen';
  static String trackYourCarScreen = '/trackYourCarScreen';
  static String chatScreen = '/chatScreen';
  static String rideCarDetailScreen = '/rideCarDetailScreen';
  static String filterScreen = '/filterScreen';
  static String loginScreen = '/loginScreen';
  static String welcomeScreen = '/welcomeScreen';
  static String signUpScreen = '/signUpScreen';
  static String forgotPasswordScreen = '/forgotPasswordScreen';
  static String otpScreen = '/otpScreen';
  static String createNewPasswordScreen = '/createNewPasswordScreen';
  static String thankYouScreen = '/thankYouScreen';
  static String settingScreen = '/settingScreen';
  static String languageListScreen = '/languageListScreen';
  static String notificationListScreen = '/notificationListScreen';
  static String searchScreen = '/searchScreen';
  static String privacyPolicyScreen = '/privacyPolicyScreen';
  static String termsConditionScreen = '/termsConditionScreen';
  static String aboutUsScreen = '/aboutUsScreen';
  static String changePasswordScreen = '/changePasswordScreen';
  static String carUpdateScreen = '/carUpdateScreen';
  static String topAdminScreen = '/topAdminScreen';

  static List<GetPage> pages = [
    GetPage(name:topAdminScreen, page: () => TopAdmin()),
    GetPage(name: dashboardScreen, page: () => DashboardScreen()),
    GetPage(name: addCarScreen, page: () => AddCarScreen()),
    GetPage(name: chatListScreen, page: () => ChatList()),
    GetPage(name: discoverScreen, page: () => DiscoverScreen()),
    GetPage(name: seeAllScreen, page: () => const SeeAllScreen()),
    GetPage(name: detailsScreen, page: () => DetailsScreen(),),
    GetPage(name: availableCarsScreen, page: () => AvailableCarsScreen()),
    GetPage(name: bottomBarScreen, page: () => BottomBarScreen()),
    GetPage(name: editProfileScreen, page: () => EditProfileScreen()),
    GetPage(name: paymentMethodScreen, page: () => PaymentMethodScreen()),
    GetPage(name: checkoutScreen, page: () => CheckoutScreen()),
    GetPage(name: checkoutListScreen, page: () => CheckoutListScreen()),
    GetPage(name: addressScreen, page: () => const AddressScreen()),
    GetPage(name: rideHistoryScreen, page: () => RideHistoryScreen()),
    GetPage(name: rideDetailsScreen, page: () => const RideDetailsScreen()),
    GetPage(name: trackYourCarScreen, page: () => TrackYourCarScreen()),
    GetPage(name: chatScreen, page: () => ChatScreen()),
    GetPage(name: rideCarDetailScreen, page: () => RideCarDetailScreen()),
    GetPage(name: filterScreen, page: () => FilterScreen()),
    GetPage(name: welcomeScreen, page: () => WellcomeScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signUpScreen, page: () => SignupScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
    GetPage(name: otpScreen, page: () => OtpScreen()),
    GetPage(name: settingScreen, page: () => SettingScreen()),
    GetPage(name: thankYouScreen, page: () => const ThankYouScreen()),
    GetPage(
        name: createNewPasswordScreen, page: () => CreateNewPasswordScreen()),
    GetPage(name: languageListScreen, page: () => LanguageListScreen()),
    GetPage(
        name: notificationListScreen,
        page: () => const NotificationListScreen()),
    GetPage(name: searchScreen, page: () => const SearchScreen()),
    GetPage(name: privacyPolicyScreen, page: () => PrivacyPolicyScreen()),
    GetPage(name: termsConditionScreen, page: () => TermsConditionScreen()),
    GetPage(name: aboutUsScreen, page: () => AboutUsScreen()),
    GetPage(name: changePasswordScreen, page: () => ChangePasswordScreen()),
  ];
}
