import 'package:json_annotation/json_annotation.dart';

part 'payment_request.g.dart';

@JsonSerializable()
class PaymentRequest {
  int amount;
  String contact = "";
  String country = "";
  String direct = "";
  String email = "";
  String firstname = "";
  String lastname = "";
  String phoneNumber;
  @JsonKey(name: 'fullname')
  String fullName = "";
  String reason = "";
  String stateData = "";

  PaymentRequest({
    required this.amount,
    this.contact = "",
    required this.country,
    this.direct = "",
    this.email = "",
    this.firstname = "",
    this.lastname = "",
    required this.phoneNumber,
    this.fullName = "",
    this.reason = "",
    this.stateData = "",
  });

  factory PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequestToJson(this);
}

@JsonSerializable()
class PaymentRequestData {
  dynamic transactionId;

  PaymentRequestData({required this.transactionId});

  factory PaymentRequestData.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequestDataToJson(this);
}

@JsonSerializable()
class Validate {
  String reason = "payment";
  String country = "CI";
  String otp = "";
  String transactionId;

  Validate({
    this.country = "CI",
    this.reason = "payment",
    required this.otp,
    required this.transactionId,
  });

  factory Validate.fromJson(Map<String, dynamic> json) =>
      _$ValidateFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateToJson(this);
}

@JsonSerializable()
class PaymentRequestDataOrangeMoney {
  String internalTransactionId;
  String status;
  int transactionId;

  PaymentRequestDataOrangeMoney({
    required this.transactionId,
    required this.internalTransactionId,
    required this.status,
  });

  factory PaymentRequestDataOrangeMoney.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestDataOrangeMoneyFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequestDataOrangeMoneyToJson(this);
}

@JsonSerializable()
class PaymentRequestDataOrangeMoneyO {
  String internalTransactionId;
  Map<String, dynamic> metadata;
  String status;
  String transactionId;

  PaymentRequestDataOrangeMoneyO({
    required this.transactionId,
    required this.metadata,
    required this.internalTransactionId,
    required this.status,
  });

  factory PaymentRequestDataOrangeMoneyO.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestDataOrangeMoneyOFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequestDataOrangeMoneyOToJson(this);
}

@JsonSerializable()
class Session {
  String? apiKey;
  int? amount;
  String? mode;
  String? sessionId;
  Map<String, dynamic>? pricing;

  Session({
    this.apiKey = "",
    this.amount = 1,
    this.mode = "",
    this.sessionId = "",
    this.pricing,
  });

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
