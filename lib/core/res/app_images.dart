import 'dart:math';

class AssetImagesPath {
  // network ===>>>
  static String networkImage() {
    // random number between 900 and 999
    final int randomNumber = 900 + Random().nextInt(100);
    return 'https://picsum.photos/$randomNumber';
  }

  /// sound ===>>>

  static const String launcherIcon = 'assets/images/ic_launcher.png';
  static const String appLogo = 'assets/images/app_logo.png';
  static const String authBackground = 'assets/images/auth_image.png';

  /// new
  static const String introOne = 'assets/images/svg/intro_1.svg';
  static const String introTwo = 'assets/images/svg/intro_2.svg';
  static const String introThree = 'assets/images/svg/intro_3.svg';
  static const String callSvg = 'assets/images/svg/call_svg.svg';
  static const String chatIcon = 'assets/images/svg/chat_icon.svg';
  static const String profileCircle = 'assets/images/svg/profile_circle.svg';
  static const backButtonSVG = 'assets/images/svg/auth_back_button.svg';
  static const notification = 'assets/images/svg/notification.svg';
  static const profile = 'assets/images/svg/profile.svg';
  static const track = 'assets/images/svg/track.svg';
  static const emptyFile = 'assets/images/svg/empty_file.svg';
  static const headPhone = 'assets/images/svg/head_phone.svg';
  static const circumstance = 'assets/images/svg/circumstance.svg';
  static const wallet = 'assets/images/svg/wallet.svg';
  static const buildRounded = 'assets/images/svg/build_rounded.svg';
  static const add = 'assets/images/svg/add.svg';
  static const dollar = 'assets/images/svg/dollar.svg';
  static const box = 'assets/images/svg/box.svg';
  static const buildRoundedCircle =
      'assets/images/svg/build_rounded_circle.svg';
  static const grayBackButton = 'assets/images/svg/gray_back_button.svg';
  static const uploadImage = 'assets/images/svg/upload_image.svg';
  static const approveOrder = 'assets/images/svg/aprove_order.svg';
  static const file = 'assets/images/svg/file.svg';
  static const sent = 'assets/images/svg/sent.svg';
  static const mshbk = 'assets/images/svg/mshbk.svg';
  static const exit = 'assets/images/svg/exit.svg';
  static const call = 'assets/images/svg/call.svg';
  static const id = 'assets/images/svg/id.svg';
  static const noImage = 'assets/images/svg/no_image.svg';
  static const calendar = 'assets/images/svg/calendar.svg';
  static const calc = 'assets/images/svg/calc.svg';
  static const gasStation = 'assets/images/svg/new_wallet.svg';
  static const greenWallet = 'assets/images/svg/green_wallet.svg';
  static const exitUp = 'assets/images/svg/exit_up.svg';
  static const changePasswordLocker =
      'assets/images/svg/change_password_locker.svg';

  /// real png ===>>>
  static const String mapTem = 'assets/images/png/map_tem.jpg';
  static const String award = 'assets/images/png/award.png';
  static const String splashBackground = 'assets/images/splash_image.png';
  static const String popUpGift = 'assets/images/pop-up gift.png';

  static const String intro1Background = 'assets/images/intro_1.png';
  static const String intro2Background = 'assets/images/intro_2.png';
  static const String intro3Background = 'assets/images/intro_3.png';
  static const String correct = 'assets/images/correct.png';
  static const String lock = 'assets/images/lock.png';
  static const String star = 'assets/images/star.png';
  static const String starLevel = 'assets/images/star_level.png';
  static const String prize = 'assets/images/prize.png';
  static const String number1 = 'assets/images/number1.png';
  static const String goldBtn = 'assets/images/gold_btn.png';
  static const String giftButton = 'assets/images/gift_button.png';
  static const String verificationBackground = 'assets/images/verification.png';
  static const String challengeBackground = 'assets/images/challenge.png';
  static const String partyBackground = 'assets/images/party.png';
  static const String cupBackground = 'assets/images/cup.png';
  static const String bigGift = 'assets/images/big_gift.png';
  static const String bigGiftWithSmall =
      'assets/images/big_gift_with_small.png';
  static const String stars = 'assets/images/stars.png';

  /// real svg ===>>>
  static const loginSVG = 'assets/images/svg/login.svg';
  static const mailBoxSVG = 'assets/images/svg/MailBox.svg';
  static const appleSVG = 'assets/images/svg/apple.svg';
  static const homeSVG = 'assets/images/svg/home.svg';
  static const homeSelectedSVG = 'assets/images/svg/home_selected.svg';
  static const searchHomeSVG = 'assets/images/svg/iconoir_search.svg';
  static const searchSelectedHomeSVG =
      'assets/images/svg/iconoir_search_selected.svg';
  static const lightMenuSVG = 'assets/images/svg/light_menu.svg';
  static const lightMenuSelectedSVG =
      'assets/images/svg/light_menu_selected.svg';
  static const cartSVG = 'assets/images/svg/proicons_cart.svg';
  static const cartSelectedSVG = 'assets/images/svg/proicons_cart_selected.svg';
  static const walletSVG = 'assets/images/svg/solar_wallet.svg';
  static const walletSelectedSVG =
      'assets/images/svg/solar_wallet_selected.svg';
  static const avatarSVG = 'assets/images/svg/avatar.svg';
  static const arrowDownSVG = 'assets/images/svg/arrow-down-s-line.svg';
  static const arrowDown2SVG = 'assets/images/svg/arrow_down.svg';
  static const addressSVG = 'assets/images/svg/address.svg';
  static const starSVG = 'assets/images/svg/star.svg';

  static const selectedSwitchSVG = 'assets/images/svg/selected_switch.svg';
  static const unselectedSwitchSVG = 'assets/images/svg/unselected_switch.svg';
  static const notificationPageSVG = 'assets/images/svg/notification_page.svg';
  static const searchSVG = 'assets/images/svg/search-line.svg';
  static const userXMarkSVG = 'assets/images/svg/user-xmark 1.svg';
  static const bellSVG = 'assets/images/svg/bell.svg';
  static const messagesSVG = 'assets/images/svg/messages.svg';
  static const sendMessageSVG = 'assets/images/svg/send_message.svg';
  static const cameraSVG = 'assets/images/svg/camera.svg';
  static const nextMonthSVG = 'assets/images/svg/next_month.svg';
  static const lastMonthSVG = 'assets/images/svg/last_month.svg';
  static const onboarding4 = 'assets/images/svg/intro_4.svg';
  static const handsBrainSVG = 'assets/images/svg/hands-brain.svg';
  static const infoSVG = 'assets/images/svg/info.svg';
  static const privacySettingsSVG = 'assets/images/svg/privacy-settings.svg';
  static const termsInfoSVG = 'assets/images/svg/terms-info.svg';
  static const userGearSVG = 'assets/images/svg/user-gear 1.svg';
  static const userLogoutSVG = 'assets/images/svg/user-logout.svg';
  static const countrySVG = 'assets/images/svg/country.svg';
  static const languageSVG = 'assets/images/svg/famicons_language.svg';
  static const helpSVG = 'assets/images/svg/help.svg';
  static const favoriteSVG = 'assets/images/svg/light_favorite.svg';
  static const verifySVG = 'assets/images/svg/verify.svg';
  static const locationSVG = 'assets/images/svg/location.svg';
  static const location2SVG = 'assets/images/svg/location2.svg';
  static const fullStarSVG = 'assets/images/svg/full_star.svg';
  static const mapSVG = 'assets/images/svg/map.svg';
  static const addSVG = 'assets/images/svg/add.svg';
  static const add2SVG = 'assets/images/svg/add2.svg';
  static const minusSVG = 'assets/images/svg/minus.svg';
  static const riyalSVG = 'assets/images/svg/riyal.svg';
  static const deleteSVG = 'assets/images/svg/delete.svg';
  static const depositSVG = 'assets/images/svg/deposit.svg';
  static const withdrawalSVG = 'assets/images/svg/withdrawal.svg';
  static const visaSVG = 'assets/images/svg/visa.svg';
  static const invoiceSVG = 'assets/images/svg/invoice.svg';
  static const cardSVG = 'assets/images/svg/card.svg';
  static const time2SVG = 'assets/images/svg/time2.svg';
  static const dateSVG = 'assets/images/svg/date.svg';
  static const date2SVG = 'assets/images/svg/date2.svg';
  static const deliveryManSVG = 'assets/images/svg/delivery-man.svg';
  static const handCashSVG = 'assets/images/svg/iconoir_hand-cash.svg';
  static const checkCircleSVG = 'assets/images/svg/check-circle.svg';
  static const closeCircleSVG = 'assets/images/svg/circle_close.svg';
  static const searchMapSVG = 'assets/images/svg/search_map.svg';
  static const questionSVG = 'assets/images/svg/question.svg';
  static const invoiceHomeSVG = 'assets/images/svg/invoice_home.svg';
  static const subscriptionSVG = 'assets/images/svg/subscription.svg';
  static const annualCheckupSVG = 'assets/images/svg/annual-checkup.svg';
  static const fileCopySVG = 'assets/images/svg/file_copy.svg';
  static const saudiRiyalSymbolSVG = 'assets/images/svg/Saudi_Riyal_Symbol.svg';
  static const consultantSVG = 'assets/images/svg/consultant.svg';
  static const consultantSelectedSVG =
      'assets/images/svg/consultant_selected.svg';
  static const clockSVG = 'assets/images/svg/clock.svg';
  static const clockSelectedSVG = 'assets/images/svg/clock_selected.svg';
  static const medicalReportSVG = 'assets/images/svg/medical-report.svg';
  static const arrowGoSVG = 'assets/images/svg/arrowGo.svg';
  static const medalSVG = 'assets/images/svg/medal.svg';
  static const myMedalsSVG = 'assets/images/svg/expenses.svg';
  static const cupSVG = 'assets/images/svg/cup.svg';
  static const cupIconSVG = 'assets/images/svg/cup_icon.svg';
  static const profileSVG = 'assets/images/svg/profile.svg';
  static const timeSVG = 'assets/images/svg/time.svg';
  static const noMatchesSVG = 'assets/images/svg/no_matches.svg';
  static const cupLogoSVG = 'assets/images/svg/cup_logo.svg';
  static const medalLeadingSVG = 'assets/images/svg/medal_leading.svg';
  static const profileLogoSVG = 'assets/images/svg/profile_logo.svg';
  static const wallet2SVG = 'assets/images/svg/wallet.svg';
  static const pencilSVG = 'assets/images/svg/Pencil.svg';
  static const crownSVG = 'assets/images/svg/crown.svg';
  static const myCartLogoSVG = 'assets/images/svg/my_cart_logo.svg';
  static const bookSVG = 'assets/images/svg/Book.svg';
  static const arrowLeftSVG = 'assets/images/svg/arrow_left.svg';
  static const askSVG = 'assets/images/svg/ask.svg';
  static const editSVG = 'assets/images/svg/edit.svg';
  static const logoutSVG = 'assets/images/svg/logout.svg';
  static const policySVG = 'assets/images/svg/policy.svg';
  static const removeSVG = 'assets/images/svg/remove.svg';
  static const drawerSVG = 'assets/images/svg/drawer.svg';
  static const seasonPointsSVG = 'assets/images/svg/season_points.svg';
  static const coinsSVG = 'assets/images/svg/coins.svg';
  static const giftStickersSVG = 'assets/images/svg/gift_sticker.svg';
  static const closeButtonSVG = 'assets/images/svg/close_button.svg';
  static const medalBoxSVG = 'assets/images/svg/medal_box.svg';
  static const infoBoxSVG = 'assets/images/svg/info_box.svg';
  static const cuttedBorderSVG = 'assets/images/svg/cutted_border.svg';
  static const medalsInnerContainerSVG =
      'assets/images/svg/medals_inner_container.svg';
  static const medalsInnerContainer2SVG =
      'assets/images/svg/medals_inner_container2.svg';
  static const correctSVG = 'assets/images/svg/correct.svg';
  static const correctOutlineSVG = 'assets/images/svg/correct_outline.svg';
  static const wrongSVG = 'assets/images/svg/wrong.svg';
  static const editBoxSVG = 'assets/images/svg/edit_box.svg';
  static const levelIconSVG = 'assets/images/svg/level_icon.svg';
  static const titleIconSVG = 'assets/images/svg/title_icon.svg';
  static const closedGiftSVG = 'assets/images/svg/closed_gift.svg';
  static const PersonIconSvg = 'assets/images/svg/Person.svg';
  static const PasswordIconSvg = 'assets/images/svg/Password.svg';
  static const HomeIconSvg = 'assets/images/svg/Home.svg';
}
