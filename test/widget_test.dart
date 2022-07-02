// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:webview_project/main.dart';
import 'package:kkiapay_flutter_sdk/kkiapayWebview.dart';

void main() {
  // final kkiapay =
  //     KKiaPay(apikey: 'apikeyisthere', amount: '3000', callback: null);

  // final mapJson = {
  //   "performed_at": "2019-12-05T10:03:44.274Z",
  //   "type": "DEBIT",
  //   "status": "FAILED",
  //   "source": "MOBILE_MONEY",
  //   "source_common_name": "mtn-benin",
  //   "amount": 1000,
  //   "fees": 0,
  //   "net": 0,
  //   "paymentlink": null,
  //   "country": "BJ",
  //   "reason": "processing_error",
  //   "state": null,
  //   "transactionId": "bxEu9odU",
  //   "performedAt": "05/12/2019"
  // };
  // test('Test get transaction info function', () async {
  //   kkiapay.client = MockClient((request) async {
  //     return Response(json.encode(mapJson), 200);
  //   });

  //   final item = await kkiapay.getTransactionInfo('bxEu9odU');
  //   expect(item['transactionId'], "bxEu9odU");

  //   // kkiapay.getTransactionInfo(transactionId)
  // });

  // test('check if function for convert to base64 retun String', () async {
  //   final base64expected = kkiapay.convertObjectToBase64(mapJson);

  //   expect(base64expected, isA<String>());
  // });
}
