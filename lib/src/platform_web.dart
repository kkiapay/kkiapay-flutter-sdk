import '../kkiapay_flutter_sdk.dart';
import 'dart:js' as js;
import 'dart:async';


class kkiapayWeb {

 static Future pay (KKiaPay paymentRequest, Function(dynamic) callback) async {
    final _data = js.JsObject.jsify({
      'amount': paymentRequest.amount.toString(),
      'key': paymentRequest.apikey.toString(),
      'sandbox': paymentRequest.sandbox.toString(),
      'name': paymentRequest.name.toString(),
      'phone': paymentRequest.phone.toString(),
      'email': paymentRequest.email.toString(),
      'data': paymentRequest.data.toString(),
      'theme': paymentRequest.theme.toString(),
      'reason': paymentRequest.reason.toString(),
      'partnerId': paymentRequest.partnerId.toString(),
      'countries': paymentRequest.countries,
    });

    void _onSuccessListener(js.JsObject response) async {
      callback( {
        'requestData':  {
          'amount': paymentRequest.amount,
          'key': paymentRequest.apikey,
          'sandbox': paymentRequest.sandbox,
          'name': paymentRequest.name,
          'phone': paymentRequest.phone,
          'email': paymentRequest.email,
          'data': paymentRequest.data,
          'theme': paymentRequest.theme,
          'countries': paymentRequest.countries.toString(),
          'reason': paymentRequest.reason.toString(),
          'partnerId': paymentRequest.partnerId.toString(),
        },
        'transactionId': response["transactionId"],
        'status': PAYMENT_SUCCESS
      } );
    }

    js.context.callMethod('addSuccessListener', [_onSuccessListener]);

    js.context.callMethod('openKkiapayWidget', [_data]);
  }

}
