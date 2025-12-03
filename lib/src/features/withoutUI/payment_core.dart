import '../../../app/app.locator.dart';
import 'domain/models/payment/payment_request.dart';
import 'methods/momo_payment_service.dart';

class kkiapay {
  static final kkiapay _singleton = kkiapay._();

  static String lastTransactionID = "";
  static String publicApikey = "";

  kkiapay._();

  static void reset() {
    locator<MoMoPaymentService>().reset();
  }

  factory kkiapay.momoPay({
    required PaymentRequest paymentRequest,
    required Function(Map<String, dynamic>) eventsCallback,
    required String mPublicApikey,
  }) {
    setupLocator();
    publicApikey = mPublicApikey;
    locator<MoMoPaymentService>().requestPayment(
      events: eventsCallback,
      paymentRequest,
    );
    return _singleton;
  }

}
