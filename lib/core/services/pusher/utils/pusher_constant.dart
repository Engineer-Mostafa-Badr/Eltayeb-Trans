// app_id = "1974021"
// key = "34994f8d80f0fc817111"
// secret = "ba547c8bc1607ec3dfd5"
// cluster = "eu"
class PusherConstant {
  static const pusherAppId = '1974021';
  static const pusherAppKey = '34994f8d80f0fc817111';
  static const pusherAppSecret = 'ba547c8bc1607ec3dfd5';
  static const pusherHost = '';
  static const pusherPort = '443';
  static const pusherScheme = 'https';
  static const pusherAppCluster = 'eu';

  static String orderChatChannel(String orderId) => 'chat-$orderId';

  static String ticketChatChannel(String ticketId) => 'ticket-$ticketId';
}
