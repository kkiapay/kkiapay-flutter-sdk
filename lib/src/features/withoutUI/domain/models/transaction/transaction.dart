import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Balance {
  int? balance;

  Balance({this.balance});

  factory Balance.fromJson(Map<String, dynamic> json) =>
      _$BalanceFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceToJson(this);
}

@JsonSerializable()
class RevertRequest {
  String transactionId;

  RevertRequest({required this.transactionId});

  factory RevertRequest.fromJson(Map<String, dynamic> json) =>
      _$RevertRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RevertRequestToJson(this);
}

@JsonSerializable()
class RevertResponse {
  String? code;
  String? description;
  String? transactionId;

  RevertResponse({this.code, this.description, this.transactionId});

  factory RevertResponse.fromJson(Map<String, dynamic> json) =>
      _$RevertResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RevertResponseToJson(this);
}

@Deprecated('PayoutRequest ')
@JsonSerializable()
class PayoutRequestOld {
  String? phoneNumber;
  String? amount;
  String? otp;

  PayoutRequestOld({this.phoneNumber, this.amount, this.otp});

  factory PayoutRequestOld.fromJson(Map<String, dynamic> json) =>
      _$PayoutRequestOldFromJson(json);

  Map<String, dynamic> toJson() => _$PayoutRequestOldToJson(this);
}

@JsonSerializable()
class WalletPayoutRequest {
  String? walletID;
  int? amount;
  String? otp;
  String? phoneNumber;

  WalletPayoutRequest({this.walletID, this.amount, this.otp, this.phoneNumber});

  factory WalletPayoutRequest.fromJson(Map<String, dynamic> json) =>
      _$WalletPayoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WalletPayoutRequestToJson(this);
}

@JsonSerializable()
class PayoutRequest {
  String otp;
  Payout payout;

  PayoutRequest({required this.otp, required this.payout});

  factory PayoutRequest.fromJson(Map<String, dynamic> json) =>
      _$PayoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PayoutRequestToJson(this);
}

@JsonSerializable()
class Payout {
  String account = ""; // accountId
  String phoneNumber = "";
  String provider = ""; //operateur
  int amount = 0;

  Payout({
    required this.account,
    required this.phoneNumber,
    required this.provider,
    required this.amount,
  });

  factory Payout.fromJson(Map<String, dynamic> json) => _$PayoutFromJson(json);

  Map<String, dynamic> toJson() => _$PayoutToJson(this);
}

@JsonSerializable()
class GetPayoutAccountResponse {
  dynamic active;

  ///mobile_money
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? gsm;

  ///wallet
  String? country;
  String? provider;
  String? walletID;

  GetPayoutAccountResponse({
    this.active,
    this.phoneNumber,
    this.gsm,
    this.provider,
    this.walletID,
  });

  factory GetPayoutAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPayoutAccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPayoutAccountResponseToJson(this);
}

@JsonSerializable()
class VerifyPhoneResponse {
  String sid;

  VerifyPhoneResponse({required this.sid});

  factory VerifyPhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyPhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyPhoneResponseToJson(this);
}

@JsonSerializable()
class PayoutResponse {
  int? amount;
  int? fees;
  String? status;
  String? transactionId;
  String? phoneNumber;

  PayoutResponse({
    this.amount,
    this.fees,
    this.status,
    this.transactionId,
    this.phoneNumber,
  });

  factory PayoutResponse.fromJson(Map<String, dynamic> json) =>
      _$PayoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PayoutResponseToJson(this);
}

@JsonSerializable()
class Transactions {
  dynamic total; // {value: 3, relation: eq},
  //double? total;
  List<Transaction>? data = [];

  Transactions({this.total = 0, this.data});

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsToJson(this);
}

@JsonSerializable()
class Transaction {
  @JsonKey(name: 'performed_at')
  String? performedAt = "";
  int? receivedAt;
  String? type = "";
  String? status;
  String? source = "";
  @JsonKey(name: 'source_common_name')
  String? sourceCommonName = "";
  dynamic amount;
  dynamic fees;
  dynamic net;
  dynamic income;
  String? reference = "";
  String? externalTransactionId = "";
  @JsonKey(name: 'paymentlink')
  String? paymentLink = "";
  String? country = "";
  String? reason = "";
  String? state = "";
  @JsonKey(name: 'transaction_key')
  String? transactionKey = "";
  String? partnerId = "";

  // int? beforeBalance;
  //int? afterBalance;
  @JsonKey(name: 'is_payout')
  bool? isPayout;
  @JsonKey(name: 'is_counted')
  bool? isCounted;
  Client? client;

  //Request? requestId ;
  String? payout;

  //Any? session ;

  Transaction({
    this.performedAt,
    this.receivedAt,
    this.type,
    this.status,
    this.source,
    this.sourceCommonName,
    this.amount,
    this.income,
    this.fees,
    this.net,
    this.state,
    this.reference,
    this.externalTransactionId,
    this.paymentLink,
    this.country,
    this.reason,
    this.transactionKey,
    this.partnerId,
    //this.beforeBalance,
    //this.afterBalance,
    this.isPayout,
    this.isCounted,
    this.client,
    /*this.requestId,*/ this.payout,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

@JsonSerializable()
class TransactionB {
  int? status;
  double? amount;

  TransactionB({this.status, this.amount});

  factory TransactionB.fromJson(Map<String, dynamic> json) =>
      _$TransactionBFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionBToJson(this);
}

@JsonSerializable()
class TransactionInfo {
  /*{
    performed_at: 2025-06-06T20:21:36.603Z,
  type: DEBIT,
  status: SUCCESS,
  source: MOBILE_MONEY,
  source_common_name: mtn-benin,
  amount: 1,
  fees: 1,
  reason: payment of 1 XOF to Business TPE 01,
  failureCode: ,
  failureMessage: ,
  state: state data,
  partnerId: ,
  feeSupportedBy: merchant,
  income: 0,
  transactionId: 1490687397590250,
  performedAt: 06/06/2025,
  client: {fullname: , phone: 22961877882, email: }
  }*/

  @JsonKey(name: 'performed_at')
  String? performedAt = "";
  int? receivedAt;
  String? type = "";
  int? status;
  String? source = "";
  String? sourceCommonName = "";
  dynamic amount;
  dynamic income;
  dynamic fees;
  dynamic net;
  String? reference = "";
  String? externalTransactionId = "";
  String? paymentlink = "";
  String? country = "";
  String? reason = "";
  String? state = "";
  @JsonKey(name: 'transaction_key')
  String? transactionKey = "";
  String? partnerId = "";
  int? beforeBalance;
  int? afterBalance;
  @JsonKey(name: 'is_payout')
  bool? isPayout;
  @JsonKey(name: 'is_counted')
  bool? isCounted;
  Client? client;
  Request? requestId;
  String? payout;

  //Any? session ;

  TransactionInfo({
    this.performedAt,
    this.receivedAt,
    this.type,
    this.status,
    this.source,
    this.sourceCommonName,
    this.amount,
    this.income,
    this.fees,
    this.net,
    this.state,
    this.reference,
    this.externalTransactionId,
    this.paymentlink,
    this.country,
    this.reason,
    this.transactionKey,
    this.partnerId,
    this.beforeBalance,
    this.afterBalance,
    this.isPayout,
    this.isCounted,
    this.client,
    this.requestId,
    this.payout,
  });

  factory TransactionInfo.fromJson(Map<String, dynamic> json) =>
      _$TransactionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionInfoToJson(this);
}

@JsonSerializable()
class Client {
  String? id = "";
  bool? deleted;
  String? country = "";
  double? createdAt = 0;
  double? updatedAt = 0;
  bool? isNewGeneration;
  String? fullname = "";
  String? phone = "";
  String? email = "";

  Client({this.id, this.deleted, this.country, this.createdAt, this.updatedAt});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

@JsonSerializable()
class Request {
  String? id = "";
  String? performedAt = "";
  String? area = "";
  String? country = "";
  String? method = "";
  String? city = "";

  //Any? timezone = "";
  String? ip = "";
  String? useragent = "";
  Location? latitudeLongitude = Location();
  double? createdAt = 0;
  String? client = "";
  String? region = "";

  //Any? xHost = "";
  double? updatedAt = 0;
  String? account = "";

  Request({
    this.id,
    this.performedAt,
    this.area,
    this.country,
    this.method,
    this.city,
    this.ip,
    this.useragent,
    this.latitudeLongitude,
    this.createdAt,
    this.client,
    this.region,
    this.account,
    this.updatedAt,
  });

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  Map<String, dynamic> toJson() => _$RequestToJson(this);
}

@JsonSerializable()
class Location {
  double? longitude = 0.0;
  double? latitude = 0.0;

  Location({this.latitude, this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class TransactionId {
  String? transactionId = "";

  TransactionId({this.transactionId});

  factory TransactionId.fromJson(Map<String, dynamic> json) =>
      _$TransactionIdFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionIdToJson(this);
}

@JsonSerializable()
class TransactionStatus {
  dynamic status;
  int? amount;
  int? fees;
  String? reference = "";
  String? externalTransactionId = "";
  String? country = "";
  String? reason = "";
  String? partnerId = "";

  TransactionStatus({
    this.status,
    this.amount,
    this.fees,
    this.reference,
    this.externalTransactionId,
    this.country,
    this.reason,
    this.partnerId,
  });

  factory TransactionStatus.fromJson(Map<String, dynamic> json) =>
      _$TransactionStatusFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionStatusToJson(this);
}

@JsonSerializable()
class Country {
  String name;
  String code;

  Country({required this.name, required this.code});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class JsonFile {
  List<Country> list;

  JsonFile({required this.list});

  factory JsonFile.fromJson(Map<String, dynamic> json) =>
      _$JsonFileFromJson(json);

  Map<String, dynamic> toJson() => _$JsonFileToJson(this);
}
