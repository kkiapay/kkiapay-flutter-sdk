import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../domain/models/payment/payment_request.dart';
import '../../domain/models/transaction/transaction.dart';
import 'interceptor/interceptor.dart';

part 'apis.g.dart';

///APIs class is for api tags
class Apis {
  static const String appBaseUrl = 'https://api.kkiapay.me';

  /// MoMo
  static const String claimChannel = '/api/v1/utils/claimchannel';
  static const String initSession = 'https://inspector.kkiapay.me/session/init';
  static const String getAmountFees = '/api/v1/utils/get-amount-with-fees';
  static const String requestPayment = '/api/v1/payments/request';
  static const String validate = '/api/v1/payments/orange-ci/validate';

  static const String transactionStatus = '/api/v1/transactions/status';
}

/// Retrofit api instance
final paymentClient = PaymentClient(
  Dio()
    ..options = BaseOptions(
      contentType: "application/json",
    )
    ..interceptors.addAll([PaymentInterceptor()]),
);

@RestApi(baseUrl: Apis.appBaseUrl)
abstract class PaymentClient {
  factory PaymentClient(Dio dio, {String baseUrl}) = _PaymentClient;

  /// ***********************************************************************

  @POST(Apis.requestPayment)
  Future<PaymentRequestData> requestPayment(
    @Header("x-api-key") String xPublicKey,
    @Body() PaymentRequest body,
  );

  @Deprecated("not util more. use requestPayment ")
  @POST(Apis.requestPayment)
  Future<PaymentRequestDataOrangeMoney> requestPaymentOrangeMoney(
    @Header("x-api-key") String xPublicKey,
    @Body() PaymentRequest body,
  );

  @POST(Apis.validate)
  Future<PaymentRequestData> validate(
    @Header("x-api-key") String xPublicKey,
    @Body() Validate body,
  );

  /// [Payment] transaction status
  @POST(Apis.transactionStatus)
  Future<TransactionStatus> getTransactionStatus(
    @Header("x-api-key") String xPublicKey,
    @Body() TransactionId body,
  );

}
