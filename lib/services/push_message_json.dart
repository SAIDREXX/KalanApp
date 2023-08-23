import 'dart:convert';
import 'package:http/http.dart' as http;

void sendPushMessage(
    List<String> tokens, String accountName, String status) async {
  try {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer AAAA9B8fKHM:APA91bGmm4DzSCzeWRKMMgOxddpRDwwaDwGpRYb0TchRtxT782XMiIpV8CTjGGRAErWGRDCSlpZD9Fa0ugnEBwBFurkOFh4kJuhazioDgLDVHNH1ijNh4ujs5-mOSA2xym6PclzLCC7K',
      },
      body: jsonEncode(
        <String, dynamic>{
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'accountName': accountName,
            'status': status,
          },
          "notification": <String, dynamic>{
            "title": 'Kalan',
            "body":
                'El usuario $accountName ha establecido su estado como $status',
            "android_channel_id": "SetStatus"
          },
          "registration_ids": tokens,
        },
      ),
    );
  } catch (e) {
    print(e);
  }
}
