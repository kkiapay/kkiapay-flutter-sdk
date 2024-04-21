import 'dart:convert';
import 'dart:ui';

/// developer account public api key
const public_api_key = 'fe285b06af51e28efa0be747ec04cd3d1c0b1006';
/// widget default theme
const defaultTheme = "#4E6BFC";

/// KKiaPay widget base url
const KKiaPayURL = "https://widget-v3.kkiapay.me";

/// const for wave payment
const WaveRedirectURI = "wave:";
const PlayStoreRedirectURI = "https://play.google.com";
const WaveStoreRedirectURI = "market://details?id=com.wave.personal";

/// static additional data
const primaryColor = Color(0xffF11C33);
const secondaryColor = Color(0xff222F5A);
const callback = "http://kkiapay.me";
const sdk = "flutter";
const url = "";
const host = "";

/// Widget payment Mode
enum PaymentMethod {
  momo,
  card,
  direct_debit
}

/// Widget event
enum CallbackStatus {
  PAYMENT_CANCELLED,
  PAYMENT_FAILED,
  PAYMENT_SUCCESS,
  PAYMENT_INIT,
}

/// widget javascript events
const NETWORK_STATE_CHANGED = 'NETWORK_STATE_CHANGED';
const INIT_WIDGET = 'INIT_WIDGET';
const WIDGET_SUCCESSFULLY_INIT = 'WIDGET_SUCCESSFULLY_INIT';
const CLOSE_WIDGET = 'CLOSE_WIDGET';
const DESTROY_WIDGET = 'DESTROY_WIDGET';
const WIDGET_SUCCESSFULLY_DESTROYED = 'WIDGET_SUCCESSFULLY_DESTROYED';
const PAYMENT_INIT = 'PAYMENT_INIT';
const PAYMENT_ABORTED = 'PAYMENT_ABORTED';
const PENDING_PAYMENT = 'PENDING_PAYMENT';
const ON_USER_FEEDBACK = 'ON_USER_FEEDBACK';
@Deprecated('We no longer send this event: in case of failure the client can either try again or cancel')
const PAYMENT_FAILED = 'PAYMENT_FAILED';
const PAYMENT_SUCCESS = 'PAYMENT_SUCCESS';
const PAYMENT_CANCELLED = 'PAYMENT_CANCELLED';
const PAYMENT_END = 'PAYMENT_END';
const RETRY_PAYMENT = 'RETRY_PAYMENT';
const UNKNOWN_EVENT = 'UNKNOWN_EVENT';

const WAVE_LINK = 'WAVE_LINK';



class SdkData {
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
    this.callbackUrl = callback,
    this.sandbox = true,
    this.apikey,
    this.theme = '#4E6BFC',
  });

  final int? amount;
  final reason, name, email, sandbox, phone, data, apikey, theme, paymentMethod, callbackUrl, countries,partnerId;

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
      'callback': callbackUrl,
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