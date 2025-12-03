
import 'package:kkiapay_flutter_sdk/src/features/withoutUI/domain/models/payment/payment_request.dart';
import 'package:kkiapay_flutter_sdk/src/utils/extension.dart';

abstract class PaymentSpec {
  void requestPayment(
    PaymentRequest mPaymentRequest, {
    String transactionId = "",
  }) {
    "new payment request at ${DateTime.now().toString()} transactionId : $transactionId"
        .i();
  }

  void callBack({String id = "", bool fromSocket = false}) {
    "new callBack at ${DateTime.now().toString()} transactionId $id fromSocket $fromSocket"
        .f();
  }
}
