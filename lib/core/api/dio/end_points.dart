import 'package:flutter/foundation.dart';

class EndPoints {
  static const String domain = kDebugMode
      ? 'eltayeb-trans.const-tech.in'
      : 'eltayeb-trans.const-tech.in';
  static const String baseUrl = 'https://$domain/api';

  /// pages
  static String privacyPolicy = 'https://$domain/ar/privacy-policy';
  static String aboutUs = 'https://$domain/ar/about-us';
  static String servicePolicy = 'https://$domain/ar/terms-conditions';
  static String useTerms = 'https://$domain/ar/usage-policy';

  /// public data
  static const String cities = '/cities';
  static const String countries = '/countries';
  static const String notifications = '/auth/notifications';
  static const String employeeNotifications = '/employee/notifications';
  static const String readAllNotifications =
      '/auth/notifications/mark-all-as-read';

  static String showNotifications(int id) => '/auth/notifications/$id';
  static const String trips = '/driver/trips';
  static const String employeeTrips = '/employee/trips';
  static const String generateNewPayLink = '/pay';
  static const String categories = '/categories';
  static const String drivers = '/employee/lookup/drivers';
  static const String trucks = '/employee/lookup/trucks';

  /// auth
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String loginRepresentative = '/auth/employee-login';
  static const String socialLogin = '/login/social/callback';
  static const String logout = '/logout';
  static const String deleteAccount = '/delete-account';
  static const String profile = '/driver/profile';
  static const String employeeProfile = '/employee/profile';
  static const String updateProfile = '/employee/profile/update';
  static const String updatePassword = '/employee/profile/update-password';
  static const String myInvoices = '/invoices';
  static const String cars = '/cars';
  static const String resendVerificationEmail = '/resend-code';
  static const String verifyEmail = '/verify';
  static const String verifyOTP = '/auth/otp-verify';
  static const String resendOTP = '/auth/login';

  /// support chat
  static String showSupportChat(int id) => '/tickets/$id/show';

  static String addComment(int id) => '/tickets/$id/add-comment';
  static String storeTicket = '/tickets/store';
  static String getAllTickets = '/tickets';

  static String closeTicket(int id) => '/tickets/$id/close';

  /// questions
  static const String questions = '/questions';

  static String saveAnswer(int questionId) => '/questions/$questionId/answer';
  static const String answers = '/answers';

  /// leads
  static const String leaderboard = '/leaderboard';
  static const String seasonalLeads = '/seasonal-leaderboard';

  /// seasons
  static const String seasons = '/seasons';

  static String seasonDetails(int season) => '/seasons/$season';

  /// cards
  static const String cards = '/cards';

  /// medals
  static const String medals = '/medals';
  static const String allMedals = '/all_medals';
  static const String photos = '/galleries';

  /// daily gifts
  static const String daysPrizes = '/days-prizes';
  static const String processPrizes = '/prizes/process-streak';

  /// leagues
  static const String leagues = '/leagues';
}
