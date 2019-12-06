import 'package:example/screens/successScreen.dart';
import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/kkiapayWebview.dart';
import 'package:kkiapay_flutter_sdk/utils/Kkiapay.dart';

void main() => runApp(App());

void sucessCallback(amount, context) {
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
    key: 'f1e7270098f811e99eae1f0cfc677927',
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
