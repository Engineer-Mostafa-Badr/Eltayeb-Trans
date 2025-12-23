import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:eltyp_delivery/config/navigator_key/navigator_key.dart';
import 'package:eltyp_delivery/core/utils/debug_utils.dart';

/// Service responsible for Firebase topic subscriptions
class FirebaseTopicService {
  /// Subscribes to topic based on current locale
  static Future<void> subscribeToTopic() async {
    String topicName = 'topic_name';
    final lanCode = NavigatorKey.context.locale.languageCode;
    switch (lanCode) {
      case 'ar':
        topicName = 'all_topic_ar';
        break;
      case 'en':
        topicName = 'all_topic_en';
        break;
      default:
        topicName = 'all_topic_ar';
        break;
    }

    DebugUtils.printFullText('topicName: $topicName');
    await FirebaseMessaging.instance.subscribeToTopic(topicName);
  }
}
