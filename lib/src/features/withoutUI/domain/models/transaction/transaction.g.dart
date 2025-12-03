// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Balance _$BalanceFromJson(Map<String, dynamic> json) => Balance(
      balance: (json['balance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
      'balance': instance.balance,
    };

RevertRequest _$RevertRequestFromJson(Map<String, dynamic> json) =>
    RevertRequest(
      transactionId: json['transactionId'] as String,
    );

Map<String, dynamic> _$RevertRequestToJson(RevertRequest instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
    };

RevertResponse _$RevertResponseFromJson(Map<String, dynamic> json) =>
    RevertResponse(
      code: json['code'] as String?,
      description: json['description'] as String?,
      transactionId: json['transactionId'] as String?,
    );

Map<String, dynamic> _$RevertResponseToJson(RevertResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'transactionId': instance.transactionId,
    };

PayoutRequestOld _$PayoutRequestOldFromJson(Map<String, dynamic> json) =>
    PayoutRequestOld(
      phoneNumber: json['phoneNumber'] as String?,
      amount: json['amount'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$PayoutRequestOldToJson(PayoutRequestOld instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'amount': instance.amount,
      'otp': instance.otp,
    };

WalletPayoutRequest _$WalletPayoutRequestFromJson(Map<String, dynamic> json) =>
    WalletPayoutRequest(
      walletID: json['walletID'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      otp: json['otp'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$WalletPayoutRequestToJson(
        WalletPayoutRequest instance) =>
    <String, dynamic>{
      'walletID': instance.walletID,
      'amount': instance.amount,
      'otp': instance.otp,
      'phoneNumber': instance.phoneNumber,
    };

PayoutRequest _$PayoutRequestFromJson(Map<String, dynamic> json) =>
    PayoutRequest(
      otp: json['otp'] as String,
      payout: Payout.fromJson(json['payout'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PayoutRequestToJson(PayoutRequest instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'payout': instance.payout,
    };

Payout _$PayoutFromJson(Map<String, dynamic> json) => Payout(
      account: json['account'] as String,
      phoneNumber: json['phoneNumber'] as String,
      provider: json['provider'] as String,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$PayoutToJson(Payout instance) => <String, dynamic>{
      'account': instance.account,
      'phoneNumber': instance.phoneNumber,
      'provider': instance.provider,
      'amount': instance.amount,
    };

GetPayoutAccountResponse _$GetPayoutAccountResponseFromJson(
        Map<String, dynamic> json) =>
    GetPayoutAccountResponse(
      active: json['active'],
      phoneNumber: json['phone_number'] as String?,
      gsm: json['gsm'] as String?,
      provider: json['provider'] as String?,
      walletID: json['walletID'] as String?,
    )..country = json['country'] as String?;

Map<String, dynamic> _$GetPayoutAccountResponseToJson(
        GetPayoutAccountResponse instance) =>
    <String, dynamic>{
      'active': instance.active,
      'phone_number': instance.phoneNumber,
      'gsm': instance.gsm,
      'country': instance.country,
      'provider': instance.provider,
      'walletID': instance.walletID,
    };

VerifyPhoneResponse _$VerifyPhoneResponseFromJson(Map<String, dynamic> json) =>
    VerifyPhoneResponse(
      sid: json['sid'] as String,
    );

Map<String, dynamic> _$VerifyPhoneResponseToJson(
        VerifyPhoneResponse instance) =>
    <String, dynamic>{
      'sid': instance.sid,
    };

PayoutResponse _$PayoutResponseFromJson(Map<String, dynamic> json) =>
    PayoutResponse(
      amount: (json['amount'] as num?)?.toInt(),
      fees: (json['fees'] as num?)?.toInt(),
      status: json['status'] as String?,
      transactionId: json['transactionId'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$PayoutResponseToJson(PayoutResponse instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'fees': instance.fees,
      'status': instance.status,
      'transactionId': instance.transactionId,
      'phoneNumber': instance.phoneNumber,
    };

Transactions _$TransactionsFromJson(Map<String, dynamic> json) => Transactions(
      total: json['total'] ?? 0,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'total': instance.total,
      'data': instance.data,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      performedAt: json['performed_at'] as String?,
      receivedAt: (json['receivedAt'] as num?)?.toInt(),
      type: json['type'] as String?,
      status: json['status'] as String?,
      source: json['source'] as String?,
      sourceCommonName: json['source_common_name'] as String?,
      amount: json['amount'],
      income: json['income'],
      fees: json['fees'],
      net: json['net'],
      state: json['state'] as String?,
      reference: json['reference'] as String?,
      externalTransactionId: json['externalTransactionId'] as String?,
      paymentLink: json['paymentlink'] as String?,
      country: json['country'] as String?,
      reason: json['reason'] as String?,
      transactionKey: json['transaction_key'] as String?,
      partnerId: json['partnerId'] as String?,
      isPayout: json['is_payout'] as bool?,
      isCounted: json['is_counted'] as bool?,
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      payout: json['payout'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'performed_at': instance.performedAt,
      'receivedAt': instance.receivedAt,
      'type': instance.type,
      'status': instance.status,
      'source': instance.source,
      'source_common_name': instance.sourceCommonName,
      'amount': instance.amount,
      'fees': instance.fees,
      'net': instance.net,
      'income': instance.income,
      'reference': instance.reference,
      'externalTransactionId': instance.externalTransactionId,
      'paymentlink': instance.paymentLink,
      'country': instance.country,
      'reason': instance.reason,
      'state': instance.state,
      'transaction_key': instance.transactionKey,
      'partnerId': instance.partnerId,
      'is_payout': instance.isPayout,
      'is_counted': instance.isCounted,
      'client': instance.client,
      'payout': instance.payout,
    };

TransactionB _$TransactionBFromJson(Map<String, dynamic> json) => TransactionB(
      status: (json['status'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TransactionBToJson(TransactionB instance) =>
    <String, dynamic>{
      'status': instance.status,
      'amount': instance.amount,
    };

TransactionInfo _$TransactionInfoFromJson(Map<String, dynamic> json) =>
    TransactionInfo(
      performedAt: json['performed_at'] as String?,
      receivedAt: (json['receivedAt'] as num?)?.toInt(),
      type: json['type'] as String?,
      status: (json['status'] as num?)?.toInt(),
      source: json['source'] as String?,
      sourceCommonName: json['sourceCommonName'] as String?,
      amount: json['amount'],
      income: json['income'],
      fees: json['fees'],
      net: json['net'],
      state: json['state'] as String?,
      reference: json['reference'] as String?,
      externalTransactionId: json['externalTransactionId'] as String?,
      paymentlink: json['paymentlink'] as String?,
      country: json['country'] as String?,
      reason: json['reason'] as String?,
      transactionKey: json['transaction_key'] as String?,
      partnerId: json['partnerId'] as String?,
      beforeBalance: (json['beforeBalance'] as num?)?.toInt(),
      afterBalance: (json['afterBalance'] as num?)?.toInt(),
      isPayout: json['is_payout'] as bool?,
      isCounted: json['is_counted'] as bool?,
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      requestId: json['requestId'] == null
          ? null
          : Request.fromJson(json['requestId'] as Map<String, dynamic>),
      payout: json['payout'] as String?,
    );

Map<String, dynamic> _$TransactionInfoToJson(TransactionInfo instance) =>
    <String, dynamic>{
      'performed_at': instance.performedAt,
      'receivedAt': instance.receivedAt,
      'type': instance.type,
      'status': instance.status,
      'source': instance.source,
      'sourceCommonName': instance.sourceCommonName,
      'amount': instance.amount,
      'income': instance.income,
      'fees': instance.fees,
      'net': instance.net,
      'reference': instance.reference,
      'externalTransactionId': instance.externalTransactionId,
      'paymentlink': instance.paymentlink,
      'country': instance.country,
      'reason': instance.reason,
      'state': instance.state,
      'transaction_key': instance.transactionKey,
      'partnerId': instance.partnerId,
      'beforeBalance': instance.beforeBalance,
      'afterBalance': instance.afterBalance,
      'is_payout': instance.isPayout,
      'is_counted': instance.isCounted,
      'client': instance.client,
      'requestId': instance.requestId,
      'payout': instance.payout,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: json['id'] as String?,
      deleted: json['deleted'] as bool?,
      country: json['country'] as String?,
      createdAt: (json['createdAt'] as num?)?.toDouble(),
      updatedAt: (json['updatedAt'] as num?)?.toDouble(),
    )
      ..isNewGeneration = json['isNewGeneration'] as bool?
      ..fullname = json['fullname'] as String?
      ..phone = json['phone'] as String?
      ..email = json['email'] as String?;

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'country': instance.country,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isNewGeneration': instance.isNewGeneration,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'email': instance.email,
    };

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      id: json['id'] as String?,
      performedAt: json['performedAt'] as String?,
      area: json['area'] as String?,
      country: json['country'] as String?,
      method: json['method'] as String?,
      city: json['city'] as String?,
      ip: json['ip'] as String?,
      useragent: json['useragent'] as String?,
      latitudeLongitude: json['latitudeLongitude'] == null
          ? null
          : Location.fromJson(
              json['latitudeLongitude'] as Map<String, dynamic>),
      createdAt: (json['createdAt'] as num?)?.toDouble(),
      client: json['client'] as String?,
      region: json['region'] as String?,
      account: json['account'] as String?,
      updatedAt: (json['updatedAt'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'id': instance.id,
      'performedAt': instance.performedAt,
      'area': instance.area,
      'country': instance.country,
      'method': instance.method,
      'city': instance.city,
      'ip': instance.ip,
      'useragent': instance.useragent,
      'latitudeLongitude': instance.latitudeLongitude,
      'createdAt': instance.createdAt,
      'client': instance.client,
      'region': instance.region,
      'updatedAt': instance.updatedAt,
      'account': instance.account,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };

TransactionId _$TransactionIdFromJson(Map<String, dynamic> json) =>
    TransactionId(
      transactionId: json['transactionId'] as String?,
    );

Map<String, dynamic> _$TransactionIdToJson(TransactionId instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
    };

TransactionStatus _$TransactionStatusFromJson(Map<String, dynamic> json) =>
    TransactionStatus(
      status: json['status'],
      amount: (json['amount'] as num?)?.toInt(),
      fees: (json['fees'] as num?)?.toInt(),
      reference: json['reference'] as String?,
      externalTransactionId: json['externalTransactionId'] as String?,
      country: json['country'] as String?,
      reason: json['reason'] as String?,
      partnerId: json['partnerId'] as String?,
    );

Map<String, dynamic> _$TransactionStatusToJson(TransactionStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'amount': instance.amount,
      'fees': instance.fees,
      'reference': instance.reference,
      'externalTransactionId': instance.externalTransactionId,
      'country': instance.country,
      'reason': instance.reason,
      'partnerId': instance.partnerId,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

JsonFile _$JsonFileFromJson(Map<String, dynamic> json) => JsonFile(
      list: (json['list'] as List<dynamic>)
          .map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JsonFileToJson(JsonFile instance) => <String, dynamic>{
      'list': instance.list,
    };
