import 'dart:math';

import 'package:kkiapay_flutter_sdk/src/utils/config.dart';
import '../features/withoutUI/domain/repository/payment_repository.dart';

extension RandomKey on int {
  String randomKey() {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random.secure();
    return List.generate(this, (_) => chars[rand.nextInt(chars.length)]).join();
  }
}

extension Inspector on String {
  i({String? origin = "", String? user = ""}) async {
    /// insert into inspector table in firestore
    /// ...
    // debugPrint("⚠️ $origin ::: $user ::: $this");
  }

  e({String? origin = "", String? user = ""}) async {
    /// insert into inspector table in firestore
    /// ...
    // debugPrint("🚨 $origin ::: $user ::: $this");
  }

  f({String? origin = "", String? user = ""}) async {
    /// insert into inspector table in firestore
    /// ...
    // debugPrint("✅ $origin ::: $user ::: $this");
  }
}

extension TransactionStatus on String {
  getStatus(Function(Map<String, dynamic>) response) {
    PaymentRepository.getPaymentStatus(this,
          () {
        response({
          "status": NOT_FOUND,
          "transactionId": this,
        });
      },
          () {
        response({
          "status": PENDING_PAYMENT,
          "transactionId": this,
        });
      },
          (isSuccess) async {
        response({
          "status": isSuccess ? PAYMENT_SUCCESS : PAYMENT_FAILED,
          "transactionId": this,
        });
      },
    );
  }
}