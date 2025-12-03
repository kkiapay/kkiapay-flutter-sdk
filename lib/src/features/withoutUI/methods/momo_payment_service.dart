import 'package:kkiapay_flutter_sdk/src/features/withoutUI/domain/models/payment/payment_request.dart';
import 'package:kkiapay_flutter_sdk/src/utils/config.dart';
import 'package:kkiapay_flutter_sdk/src/utils/extension.dart';
import 'package:stacked/stacked.dart';

import '../domain/models/payment_spec.dart';
import '../domain/repository/payment_repository.dart';
import '../domain/repository/socket.dart';
import '../payment_core.dart';

class MoMoPaymentService extends PaymentSpec with ListenableServiceMixin {
  MoMoPaymentService() {
    listenToReactiveValues([_paymentRequest, _transactionId]);
  }

  String reset() {
    setBusy(false);
    updatePaymentRequest(
      PaymentRequest(
        amount: 0,
        phoneNumber: "",
        country: '',
      ),
    );
    updateTransactionId("");
    kkiapay.lastTransactionID = "";
    setI(40);
    kSocket.disconnect();
    return "";
  }

  late var kSocket = MySocket();

  final ReactiveValue<PaymentRequest> _paymentRequest =
  ReactiveValue<PaymentRequest>(
    PaymentRequest(
      amount: 0,
      contact: "",
      country: "",
      direct: "",
      email: "",
      firstname: "",
      lastname: "",
      phoneNumber: "",
      fullName: "",
      reason: "",
    ),
  );

  ReactiveValue<PaymentRequest> get paymentRequest => _paymentRequest;

  void updatePaymentRequest(value) {
    _paymentRequest.value = value;
    notifyListeners();
  }

  final ReactiveValue<String> _transactionId = ReactiveValue<String>("");

  ReactiveValue<String> get transactionId => _transactionId;

  void updateTransactionId(value) {
    _transactionId.value = value;
    notifyListeners();
  }

  final ReactiveValue<bool> _isBusy = ReactiveValue<bool>(false);

  ReactiveValue<bool> get isBusy => _isBusy;

  void setBusy(value) {
    _isBusy.value = value;
    notifyListeners();
  }

  final ReactiveValue<int> _i = ReactiveValue<int>(0);

  ReactiveValue<int> get i => _i;

  void setI(value) {
    _i.value = value;
    notifyListeners();
  }

  final ReactiveValue<String> _qrCodeContent = ReactiveValue<String>("empty");

  ReactiveValue<String> get qrCodeContent => _qrCodeContent;

  void updateQrCodeContent(value) {
    _qrCodeContent.value = value;
    notifyListeners();
  }

  @override
  void requestPayment(
      PaymentRequest mPaymentRequest, {
        String transactionId = "",
        Function(Map<String, dynamic>)? events,
      }) async {
    setBusy(true);
    PaymentRepository.requestMoMoPayment(
      mPaymentRequest,
      onFailure: (object) {
        setBusy(false);
        events!({
          "status": PAYMENT_FAILED,
          'error_code': object.toString(),
        });
      },
      onSuccess: (mPaymentRequestData) async {
        updatePaymentRequest(mPaymentRequest);
        updateTransactionId("${mPaymentRequestData!.transactionId}");
        kkiapay.lastTransactionID = "${mPaymentRequestData.transactionId}";
        callBack(events: events);
        super.requestPayment(
          mPaymentRequest,
          transactionId: "${mPaymentRequestData.transactionId}",
        );

        setBusy(false);

        events!({
          "status": PAYMENT_INIT,
          'transactionId': "${mPaymentRequestData.transactionId}",
        });

        /// onBackPressed control
        "result == aborted".e();
        //_reset();
      },
    );
  }

  @override
  void callBack({
    String id = "",
    bool fromSocket = false,
    Function(Map<String, dynamic>)? events,
  }) async {
    "transactionId.listen:: ${transactionId.value}".i();
    if (transactionId.value.isNotEmpty) {
      String apiKey = kkiapay.publicApikey;

      /// add socket connection to get validation status
      var query = {"apikey": apiKey, "contact": paymentRequest.value.contact};
      kSocket = MySocket(mQuery: query);

      /// only for orange money payment
      kSocket.onPaymentProcessing((metadata, status, transactionId) async {
        try {
          events!({
            "status": PAYMENT_PROCESSING,
            "transactionId": transactionId,
            "payment_url": metadata["payment_url"].toString(),
          });
          updateQrCodeContent(metadata["payment_url"].toString());
        } catch (e) {
          e.toString().e(origin: "onPaymentProcessing");
        }
      });

      kSocket.onPaymentBack((status, transactionId, { failureCode = "NONE" }) async {
        if (paymentRequest.value.amount != 0) {
          String lastId = kkiapay.lastTransactionID;
          if (lastId.startsWith(transactionId)) {
            "lastId.startsWith:: ${lastId.startsWith(transactionId)}".f();
            events!({
              "status": status ? PAYMENT_SUCCESS : PAYMENT_FAILED,
              "transactionId": transactionId,
              "error_code": failureCode,
            });
            "_reset:: ${reset()}".f();
          }
        }
      });
      kSocket.connect(() async {
        if (kSocket.isConnected()) {
          events!({"status": PENDING_PAYMENT});
        }
      });

      /// add pooling until status callback
      await Future.delayed(Duration(seconds: 1));
      setI(0);
      while (i.value < 40) {
        PaymentRepository.getPaymentStatus(
          transactionId.value,
              () {
            setI(40);
            return;
          },
              () {
            "pooling:: ${_i.value++}".i();
            return;
          },
              (isSuccess) async {
            if (paymentRequest.value.amount != 0) {
              String lastId = kkiapay.lastTransactionID;
              if (lastId.startsWith(transactionId.value)) {
                "lastId.startsWith:: ${lastId.startsWith(transactionId.value)}"
                    .f();
                events!({
                  "status": isSuccess ? PAYMENT_SUCCESS : PAYMENT_FAILED,
                  "transactionId": transactionId,
                });
                "_reset:: ${reset()}".f();
              }
            }
            super.callBack(id: transactionId.value);
          },
        );
        await Future.delayed(const Duration(seconds: 3));
      }
    }
  }

  Future validateOrangeMoneyPayment(String otp, Function(Map<String, dynamic>) response) async {
    try {
      PaymentRepository.validate(
        Validate(otp: otp, transactionId: transactionId.value),
        onFailure: (object) {
          response({
            'error_code': object.toString(),
          });
          ">>> ${object.toString()}".e(origin: "PaymentRepository.validate");
        },
        onSuccess: (id) {
          response(id.toJson());
        },
      );
    } catch (e) {
      ">>> $e".e(origin: "validateOrangeMoneyPayment");
    }
  }
}
