import 'dart:convert';

import 'dart:ui';

const KKiaPayURL = "https://widget-v3.kkiapay.me";
const KKiaPayRedirectURL = "http://redirect.kkiapay.me";
const key = "xxxxxxxxxxxxxxxxxxxxxx";

/// API Key */
const callback = 'http://redirect.kkiapay.me';

/// Webhook */
const sdk = "flutter";
const defaultTheme = "#4E6BFC";
const nColorPrimary = Color(0xffF11C33);
const nColorSecondary = Color(0xff222F5A);
const nColorYellow = Color(0xffE8C145);
const nColorGray1 = Color(0xffF9F9F9);
const nColorGray2 = Color(0xeaeaea);

/// Widget hex color */
const url = "";

/// Widget header image url */
const host = ""; /** package name **/

/// Widget payment Mode
enum PaymentMethod {
  momo,
  card,
  direct_debit
}

class SdkData {
  /// @Params amount : Payment amount
  /// @Params reason : Payment reason
  /// @Params name : Payment owner
  /// @Params phone : Payment phoneNumber
  /// @Params data : Payment data send by webhook
  /// @Params sandbox : Payment request made in sandbox
  SdkData({
    this.amount,
    this.paymentMethod,
    this.reason,
    this.name,
    this.email,
    this.partnerId,
    this.countries,
    this.phone,
    this.data,
    this.sandbox = true,
    this.apikey,
    this.theme = '#4E6BFC',
  });

  final int? amount;
  final reason, name, email, sandbox, phone, data, apikey, theme, paymentMethod, countries,partnerId;

  Map<String, dynamic> toMap() {
    return {
      'partnerId': partnerId,
      'countries': countries,
      'serviceId': "INTEGRATION",
      'amount': amount,
      'paymentMethods': paymentMethod ?? ["momo","card","direct_debit"],
      'reason': reason,
      'fullname': name,
      'email': email,
      'sandbox': sandbox,
      'key': apikey,
      'callback': callback,
      'phoneNumber': phone,
      'sdk': sdk,
      'theme': theme,
      'url': url,
      'host': host,
      'data': data
    };
  }

  String toBase64() {
    var json = jsonEncode(this.toMap());
    var bytes = utf8.encode(json);
    return base64.encode(bytes);
  }
}

//    var json = jsonEncode({"amount":100,"sandbox":false,"serviceId":"INTEGRATION","position":"left","theme":"primary","key":"LprYUAyMpfAjq4z2yTHPiY0b6XktIQ","paymentMethods":["momo","card","direct_debit"]});