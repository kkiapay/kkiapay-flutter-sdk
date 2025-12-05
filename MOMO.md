# Payment_core_flutter

## Init payment without ui

Mobile Money:

```dart
    var paymentRequest = PaymentRequest(
        amount: 1,
        country: "BJ",
        phoneNumber: "229XXXXXXXX",
    );

    kkiapay.momoPay(
        paymentRequest: paymentRequest, /// required field
        eventsCallback: (Map<String, dynamic> object) { },/// required field
        mPublicApikey: "KKIAPAY_PUBLIC_API_KEY",
    );
```

## Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kkiapay_flutter_sdk/kkiapay_flutter_sdk.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed( seedColor: secondaryColor ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CallbackStatus? _currentState;

  _cashIn() {
    var paymentRequest = PaymentRequest(
        amount: 1,
        country: "BJ",
        phoneNumber: "2290161XXXXXX",
        partnerId: ""
    );
    kkiapay.momoPay(
      paymentRequest: paymentRequest,
      eventsCallback: (Map<String, dynamic> object) {
        switch ( object['status'] ) {
          case PENDING_PAYMENT:
          /// you may want to show a loading spinner
            debugPrint(PAYMENT_INIT);
            setState(() {
              _currentState= CallbackStatus.PAYMENT_INIT;
            });
            break;
          case PAYMENT_PROCESSING:
          /// only for orange money
            debugPrint(PAYMENT_PROCESSING);
            break;
          case PAYMENT_FAILED:
          /// you may want to show a failed payment message
            debugPrint(PAYMENT_FAILED);
            setState(() {
              _currentState= CallbackStatus.PAYMENT_FAILED;
            });
            break;
          case PAYMENT_SUCCESS:
          /// you may want to show a success payment message
            debugPrint(PAYMENT_SUCCESS);
            setState(() {
              _currentState= CallbackStatus.PAYMENT_SUCCESS;
            });
            break;
          default:
            debugPrint(UNKNOWN_EVENT);
            break;
        }
      },
      mPublicApikey: "KKIAPAY_PUBLIC_API_KEY",
    );
  }

  _mainView() {
    return Column(
      children: [
        Text("Cliquez pour encaisser",
            style: Theme.of(context).textTheme.headlineMedium),
        MaterialButton(
            color: primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            onPressed: _cashIn,
            child: Text("Encaisser", style: TextStyle(
                color: Colors.white,
                fontSize: 16
            )))
      ],
    );
  }

  _paymentStateView() {
    return Column(
      children: [
        SvgPicture.asset(
            _currentState==CallbackStatus.PAYMENT_INIT?
            "Assets/svg/Pending.svg":
            _currentState==CallbackStatus.PAYMENT_SUCCESS?
            "Assets/svg/Succeed.svg": "Assets/svg/Error.svg" ),
        Text(
            _currentState==CallbackStatus.PAYMENT_INIT?
            "En attente de validation...":
            _currentState==CallbackStatus.PAYMENT_SUCCESS?
            "Encaissement validé": "Echec du paiement"),
        SizedBox( height: 24, ),
        if(_currentState!=CallbackStatus.PAYMENT_INIT)
          MaterialButton(
              color: secondaryColor,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              onPressed: (){
                setState(() {
                  _currentState= null;
                });
              },
              child: Text("Nouveau paiement", style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              )))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _currentState == null ? _mainView() : _paymentStateView()
          ],
        ),
      ),
    );
  }
}
```

## Reference

<table>
<tr><td>Argument</td><td>Type</td><td>Required</td><td>Details</td></tr>
<tr><td>phoneNumber</td><td>String</td><td>Yes</td><td>Valid mobile money number to debit. ex : 22967434270 </td></tr>
<tr><td>amount</td><td>Numeric</td><td>Yes</td><td>Amount to debit from user account (XOF) </td></tr>
<tr><td>fullName</td><td>String</td><td>No</td><td>Client firstname and lastname </td></tr>
<tr><td>reason</td><td>String</td><td>No</td><td>Your transaction reason </td></tr>
<tr><td>country</td><td>String</td><td>No</td><td>Set payment country ex: "CI" </td></tr>
<tr><td>partnerId</td><td>String</td><td>No</td><td>Add a partner id to find transaction" </td></tr>
</table>

```dart
the successCallback function takes two parameters in the following order
- Map<String,dynamic> containing the transaction information
  {
    'status': String,
    'transactionId': String,
    'payment_url': String,
    'error_code': String,
  }
  
```

## Issues and feedback

Please file [issues](https://github.com/kkiapay/kkiapay-flutter-sdk/issues/new)
to send feedback or report a bug. Thank you!
gir