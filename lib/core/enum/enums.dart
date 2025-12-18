enum NotificationType { trip, maintenance, expense, appUpdate }

enum FinancialMovementType { returnAdd, fuel, maintenance, tire }

enum DocumentStatus { valid, expired, underReview }

enum RequestState { initial, loading, loaded, error }

enum UserRoleEnum { client, vendor }

enum NotificationsEnum { order, transaction, message, notification, service, offer, support }

enum MessageTypes { text, image, video, audio, file }

MessageTypes convertMessageType(String type) {
  switch (type) {
    case 'text':
      return MessageTypes.text;
    case 'image':
      return MessageTypes.image;
    case 'video':
      return MessageTypes.video;
    case 'audio':
      return MessageTypes.audio;
    case 'file':
      return MessageTypes.file;
    default:
      return MessageTypes.text;
  }
}

enum SocialProvidersEnum { google, apple }

enum PaymentMethodsEnum { direct, tamara, tabby }

enum OrderStatusEnum {
  active,
  in_progress,
  price_quotation,
  finished,

  /// unused in tab
  waiting_vendor_offers,
  offer_selected_waiting_vendor,
  waiting_vendor_accept,
  vendor_accepted,
  advance_payment_paid,
  delivery_confirmed,
  cancelled,

  /// can't cancel when
  /// comments means that status id exists in another line
  vendor_rejected,
  // waiting_final_payment
  completed_by_vendor,
  // finished

  /// waiting payment
  waiting_advance_payment,
  waiting_final_payment,
}

enum ProvidersFilterEnum { nearby, highest_rate }

enum UserTypeEnum { user, marketer, coordinator, trainer }

enum SubscribeStatusEnum { pending, done, in_progress, cancelled }

enum PayDirectlyButtonType { all_price, part_of_price }

enum QuestionsFilterType {
  now('today_matches'),
  coming('upcoming_matches');

  // expired('expired_matches'),
  final String title;

  const QuestionsFilterType(this.title);
}
