# kkiapay_flutter_sdk

[Kkiapay](https://kkiapay.me) is developer friendly solution that allows you to accept mobile money and credit card payments
in your application or website.

Before using this SDK, make sure you have a right Merchant Account on [Kkiapay](https://kkiapay.me), otherwise [go](https://kkiapay.me)
and create your account is free and without pain :sunglasses:.

<p align="center">
<a href="https://pub.dev/packages/kkiapay_flutter_sdk"><img src="https://img.shields.io/pub/v/kkiapay_flutter_sdk.svg" alt="version"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
<a href="https://pub.dev/packages/kkiapay_flutter_sdk/score"><img src="https://img.shields.io/pub/likes/kkiapay_flutter_sdk?logo=dart" alt="popularity"></a>
<a><img src="https://img.shields.io/badge/all_contributors-7-orange.svg?style=flat-square" alt="all contributors"></a>
</p>

## Installation

To use this package :

```yaml
dependencies:
  flutter:
    sdk: flutter
  kkiapay_flutter_sdk:
```

For web

```html
add to your index.html
<script src="https://cdn.kkiapay.me/k.js"></script>
```

## Usage

```dart
    import 'package:kkiapay_flutter_sdk/kkiapay_flutter_sdk.dart';
```

#### Initialise the Kkiapay Instance

```dart
final kkiapay = KKiaPay(
    @required callback: Function(Map<String, dynamic> response, BuildContext context),
    @required amount: int, // Ex : 1000
    @required apikey: String, // Ex : XXXX_public_api_key_XXX
    @required sandbox: bool, // Ex : true
    data: String, // Ex : 'Big data'
    phone: String, // Ex : "22961000000"
    name: String, // Ex : "John Doe"
    reason: String, // Ex : "transaction reason"
    email: String, // Ex : "email@mail.com"
    callbackUrl: String, // Ex : "http://kkiapay.me"
    theme: String, // Ex : "#222F5A"
    countries: List<String>, // Ex :  ["CI","BJ"]
    partnerId: String, // Ex : 'AxXxXXxId'
    paymentMethods: List<String> // Ex : ["momo","card"]
);
```

#### Create payment webview instance

Mobile:

```dart
    Navigator.push( context, MaterialPageRoute(builder: (context) => kkiapay), );
```

Web:

```dart
    KkiapayFlutterSdkPlatform.instance.pay( kkiapay, context, callback );
```

## Example

```dart
import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/kkiapay_flutter_sdk.dart';


void main() => runApp(App());

void callback(response, context) {
  switch ( response['status'] ) {

    case PAYMENT_CANCELLED:
      Navigator.pop(context);
      debugPrint(PAYMENT_CANCELLED);
    break;

    case PAYMENT_INIT:
      debugPrint(PAYMENT_INIT);
      break;

    case PENDING_PAYMENT:
      debugPrint(PENDING_PAYMENT);
      break;
      
    case PAYMENT_SUCCESS:
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessScreen(
            amount: response['requestData']['amount'],
            transactionId: response['transactionId'],
          ),
        ),
      );
      break;

    default:
      debugPrint(UNKNOWN_EVENT);
      break;
  }
}

final kkiapay = KKiaPay(
    amount: 1000,//
    countries: ["BJ","CI","SN","TG"],//
    phone: "22961000000",//
    name: "John Doe",//
    email: "email@mail.com",//
    reason: 'Transaction reason',//
    data: 'Fake data',//
    sandbox: true,//
    apikey: public_api_key,//
    callback: callback,//
    theme: defaultTheme, // Ex : "#222F5A",
    partnerId: 'AxXxXXxId',//
    paymentMethods: ["momo","card"]//
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: nColorPrimary,
          title: Text('Kkiapay Sample'),
          centerTitle: true,
        ),
        body: KkiapaySample(),
      ),
    );
  }
}

class KkiapaySample extends StatelessWidget {
  const KkiapaySample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 500.0,
              height: 100.0,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff222F5A)),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => kkiapay),
                  );
                },
              ),
            ),
            const SizedBox(height: 50,),
            ButtonTheme(
              minWidth: 500.0,
              height: 100.0,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(const Color(0xff222F5A)),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text(
                  'Pay Now ( WEB )',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  KkiapayFlutterSdkPlatform.instance.pay(kkiapay, context, callback);
                },
              ),
            )
          ],
        )
    );
  }
}

```

### Reference

<table>
<tr><td>Argument</td><td>Type</td><td>Required</td><td>Details</td></tr>
<tr><td>phone</td><td>String</td><td>Yes</td><td>Valid mobile money number to debit. ex : 22967434270 </td></tr>
<tr><td>amount</td><td>Numeric</td><td>Yes</td><td>Amount to debit from user account (XOF) </td></tr>
<tr><td>name</td><td>String</td><td>No</td><td>Client firstname and lastname </td></tr>
<tr><td>partnerId</td><td>String</td><td>No</td><td>Your id to find transaction</td></tr>
<tr><td>countries</td><td>List of String</td><td>No</td><td>Set widget countries ex: ["CI"] </td></tr>
<tr><td>paymentMethods</td><td>List of String</td><td>No</td><td>Set widget payment methods ex: ["momo","card"] </td></tr>
<tr><td>theme</td><td>String</td><td>No</td><td> the hexadecimal code of the color you want to give to your widget </td></tr>
<tr><td>apikey</td><td>String</td><td>Yes</td><td>public api key</td></tr>
<tr><td>sandbox</td><td>Boolean</td><td>No</td><td>The true value of this attribute allows you to switch to test mode</td></tr>
<tr><td>successCallback</td><td>Function</td><td>Yes</td><td>This function is called once the payment has been successfully made</td></tr>
</table>

```dart
the successCallback function takes two parameters in the following order
- Map<String,dynamic> containing the transaction information
  { 
    'requestData': {
      'amount': int,
      'phone': String,
      'reason': String,
      'data': String,
      'partnerId': String,
      'sandbox': bool,
      'name': String,
      'email': String
    },
    'transactionId': String, 
    'status': String 
  }
  
- the context of type BuildContext
```

### Issues and feedback

Please file [issues](https://github.com/kkiapay/kkiapay-flutter-sdk/issues/new)
to send feedback or report a bug. Thank you!
gir
