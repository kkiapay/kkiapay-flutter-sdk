// import 'successScreen.dart';
// import 'package:example/screens/main.dart' ;
import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/kkiapayWebview.dart';
import 'package:kkiapay_flutter_sdk/utils/Kkiapay.dart';
import './successScreen.dart';


void main() => runApp(App());

void sucessCallback(amount, context) {
  Navigator.pop(context);
  print('function appelé avec succès');
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => SuccessScreen(
              amount: amount,
            )),
  );
}
// KkiapayWebview()
// _SdkData()

final kkiapay = KKiaPay(amount: 1,phone: '97000000',data: 'hello world',sandbox: true,apikey: 'f1e7270098f811e99eae1f0cfc677927',callback: sucessCallback,);

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
              MaterialPageRoute(builder: (context) => kkiapay),
            );
          },
        ),
      ),
    );
  }
}
