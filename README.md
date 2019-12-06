# kkiapay_flutter_sdk

[Kkiapay](https://kkiapay.me) is developer friendly solution that allows you to accept mobile money and credit card payments
in your application or website.

Before using this SDK, make sure you have a right Merchant Account on [Kkiapay](https://kkiapay.me), otherwise [go](https://kkiapay.me)
and create your account is free and without pain :sunglasses:.

## Installation

To use this package :

```yaml
dependencies:
  flutter:
    sdk: flutter
  kkiapay_flutter_sdk:
```

## Usage

```dart
    import 'package:kkiapay_flutter_sdk/kkiapayWebview.dart';
    import 'package:kkiapay_flutter_sdk/utils/Kkiapay.dart';
```
##### Initialise the Kkiapay Instance

```dart
final kkiapay = Kkiapay(
    @required sucessCallback: Function,
    @required amount: String,
    @required key: String,
    sandbox: bool,
    data: String,
    phone: String,
    name: String,
    theme: dynamic
);

```

##### Create payment webview instance

```dart
final Widget kkiapayWebview = KkiapayWebview(kkiapay)
```

## Example

```dart
import 'package:example/screens/successScreen.dart';
import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/kkiapayWebview.dart';
import 'package:kkiapay_flutter_sdk/utils/Kkiapay.dart';

void main() => runApp(App());

void sucessCallback(Map<String,dynamic> transactionInfo, context) {
  // Navigator.pop(context);
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => SuccessScreen(
              amount: amount,
            )),
  );
}

final kkiapay = Kkiapay(
    sucessCallback: sucessCallback,
    amount: '2000',
    sandbox: true,
    data: 'fakedata',
    //put your api key there
    key: 'xxxxxxxxxxxxxxxxxxxxxxx',
    phone: '97000000',
    name: 'JOHN DOE',
    theme: '#2ba359');

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Kkiapay Sample'),
        centerTitle: true,
      ),
      body: KkiapaySample(),
    ));
  }
}

class KkiapaySample extends StatelessWidget {
  const KkiapaySample({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: FlatButton(
          color: Color(0xFFE30E25),
          child: Text(
            'Pay Now',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KkiapayWebview(kkiapay)),
            );
          },
        ),
      ),
    );
  }
}

```

### Reference



### Issues and feedback

Please file [issues](https://github.com/kkiapay/kkiapay-flutter-sdk/issues/new)
to send feedback or report a bug. Thank you!