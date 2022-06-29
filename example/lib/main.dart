import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/kkiapayConf.sample.dart';
import 'package:kkiapay_flutter_sdk/kkiapayWebview.dart';
import './successScreen.dart';

void main() => runApp(App());

void successCallback(response, context) {
  print(response);
  Navigator.pop(context);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SuccessScreen(
        amount: response['amount'],
        transactionId: response['transactionId'],
      ),
    ),
  );
}

final kkiapay = KKiaPay(
  amount: 1,
  phone: '61000000',
  data: 'hello world',
  sandbox: true,
  apikey: 'xxx',
  callback: successCallback,
  name: 'JOHN DOE',
  theme: "#E30E25",
  //paymentMethod: PaymentMethod.momo, // or PaymentMethod.card
);

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
      child: ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFFE30E25)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Text(
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
    );
  }
}
