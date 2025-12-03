
import 'package:kkiapay_flutter_sdk/src/features/withoutUI/domain/models/payment/payment_request.dart';
import 'package:kkiapay_flutter_sdk/src/utils/extension.dart';

import '../../payment_core.dart';
import '../apis/apis.dart';
import '../models/transaction/transaction.dart';

class PaymentRepository {

  static Future<void> requestMoMoPayment(
    PaymentRequest paymentRequest, {
    required Function(PaymentRequestData?) onSuccess,
    required Function(Object) onFailure,
  }) async {
    String mApiKey = kkiapay.publicApikey;
    paymentRequest.contact = 24.randomKey();
    PaymentRepository.requestPayment(
      paymentRequest,
      apiKey: mApiKey,
      onFailure: onFailure,
      onSuccess: onSuccess,
    );
  }

  static Future<void> requestPayment(
    PaymentRequest paymentRequest, {
    required Function(PaymentRequestData?) onSuccess,
    required Function(Object) onFailure,
    required String apiKey,
  }) async {
    try {
      paymentClient
          .requestPayment(apiKey, paymentRequest)
          .then((it) async {
            onSuccess(it);
          })
          .catchError((Object obj) {
            onFailure(obj);
          });
    } catch (e) {
      "completeExceptionally:: Cause:: $e ".e(origin: "requestPayment");
    }
  }

  static Future<void> getPaymentStatus(
    String transactionId,
    Function() onFail,
    Function() pending,
    Function(bool) callBack,
  ) async {
    String mApiKey = kkiapay.publicApikey;
    paymentClient
        .getTransactionStatus(
          mApiKey,
          TransactionId(transactionId: transactionId),
        )
        .then((it) async {
          if (it.status.toString() == '1' ||
              it.status.toString() == '3' ||
              it.status.toString() == "FAILED" ||
              it.status.toString() == "SUCCESS") {
            callBack(
              it.status.toString() == '1' || it.status.toString() == "SUCCESS",
            );
          } else {
            pending();
          }
        })
        .catchError((Object obj) {
          onFail();
        });
  }

  static Future<void> validate(
    Validate validate, {
    required Function(PaymentRequestData) onSuccess,
    required Function(Object) onFailure,
  }) async {
    String mApiKey = kkiapay.publicApikey;
    try {
      paymentClient
          .validate(mApiKey, validate)
          .then((it) async {
            onSuccess(it);
          })
          .catchError((Object obj) {
            onFailure(obj);
          });
    } catch (e) {
      "Cause:: $e".e(origin: "validate");
    }
  }

}
