// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) =>
    PaymentRequest(
      amount: (json['amount'] as num).toInt(),
      contact: json['contact'] as String? ?? "",
      country: json['country'] as String,
      direct: json['direct'] as String? ?? "",
      email: json['email'] as String? ?? "",
      firstname: json['firstname'] as String? ?? "",
      lastname: json['lastname'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String,
      fullName: json['fullname'] as String? ?? "",
      reason: json['reason'] as String? ?? "",
      stateData: json['stateData'] as String? ?? "",
    );

Map<String, dynamic> _$PaymentRequestToJson(PaymentRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'contact': instance.contact,
      'country': instance.country,
      'direct': instance.direct,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'phoneNumber': instance.phoneNumber,
      'fullname': instance.fullName,
      'reason': instance.reason,
      'stateData': instance.stateData,
    };

PaymentRequestData _$PaymentRequestDataFromJson(Map<String, dynamic> json) =>
    PaymentRequestData(
      transactionId: json['transactionId'],
    );

Map<String, dynamic> _$PaymentRequestDataToJson(PaymentRequestData instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
    };

Validate _$ValidateFromJson(Map<String, dynamic> json) => Validate(
      country: json['country'] as String? ?? "CI",
      reason: json['reason'] as String? ?? "payment",
      otp: json['otp'] as String,
      transactionId: json['transactionId'] as String,
    );

Map<String, dynamic> _$ValidateToJson(Validate instance) => <String, dynamic>{
      'reason': instance.reason,
      'country': instance.country,
      'otp': instance.otp,
      'transactionId': instance.transactionId,
    };

PaymentRequestDataOrangeMoney _$PaymentRequestDataOrangeMoneyFromJson(
        Map<String, dynamic> json) =>
    PaymentRequestDataOrangeMoney(
      transactionId: (json['transactionId'] as num).toInt(),
      internalTransactionId: json['internalTransactionId'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$PaymentRequestDataOrangeMoneyToJson(
        PaymentRequestDataOrangeMoney instance) =>
    <String, dynamic>{
      'internalTransactionId': instance.internalTransactionId,
      'status': instance.status,
      'transactionId': instance.transactionId,
    };

PaymentRequestDataOrangeMoneyO _$PaymentRequestDataOrangeMoneyOFromJson(
        Map<String, dynamic> json) =>
    PaymentRequestDataOrangeMoneyO(
      transactionId: json['transactionId'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      internalTransactionId: json['internalTransactionId'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$PaymentRequestDataOrangeMoneyOToJson(
        PaymentRequestDataOrangeMoneyO instance) =>
    <String, dynamic>{
      'internalTransactionId': instance.internalTransactionId,
      'metadata': instance.metadata,
      'status': instance.status,
      'transactionId': instance.transactionId,
    };

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      apiKey: json['apiKey'] as String? ?? "",
      amount: (json['amount'] as num?)?.toInt() ?? 1,
      mode: json['mode'] as String? ?? "",
      sessionId: json['sessionId'] as String? ?? "",
      pricing: json['pricing'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'apiKey': instance.apiKey,
      'amount': instance.amount,
      'mode': instance.mode,
      'sessionId': instance.sessionId,
      'pricing': instance.pricing,
    };
