import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/kkiapay/view/widget_builder_view.dart';
import 'package:kkiapay_flutter_sdk/utils/kkiapayConf.sample.dart';
import './successScreen.dart';

void main() => runApp(App());

void successCallback(response, context) {
  Navigator.pop(context);

  switch ( response['status'] ) {

   case PAYMENT_CANCELLED: print(PAYMENT_CANCELLED);
   break;

    case PAYMENT_SUCCESS:
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

    case PAYMENT_FAILED: print(PAYMENT_FAILED);
    break;

    default:
      break;
  }
}

final kkiapay = KKiaPay(
    amount: 1000,
    //countries: [],
    phone: "22961000000",
    name: "John Doe",
    email: "email@mail.com",
    reason: 'transaction reason',
    data: 'Fake data',
    sandbox: true,
    apikey: '299d09a01c5811ec917be1e6b38a3730',
    callback: successCallback,
    theme: defaultTheme, // Ex : "#222F5A",
    partnerId: 'AxXxXXxId',
//    paymentMethods: ["momo","card"]
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
          )
        ],
      )
    );
  }
}
