import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/src/widget_builder_view.dart';
import 'package:kkiapay_flutter_sdk/utils/config.dart';
import './successScreen.dart';

void main() => runApp(App());

void successCallback(response, context) {


  switch ( response['status'] ) {

    case PAYMENT_CANCELLED: print(PAYMENT_CANCELLED);
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(PAYMENT_CANCELLED),));
    break;

    case PENDING_PAYMENT : print(PENDING_PAYMENT);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(PENDING_PAYMENT),));
    break;

    case PAYMENT_INIT : print(PAYMENT_INIT);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(PAYMENT_INIT),));
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(PAYMENT_SUCCESS),));
      break;

    case PAYMENT_FAILED: print(PAYMENT_FAILED);
    break;

    default:
      break;
  }
}

const kkiapay = KKiaPay(
    amount: 1000,
    countries: ["BJ"],
    phone: "22961000000",
    name: "John Doe",
    email: "email@mail.com",
    reason: 'transaction reason',
    data: 'Fake data',
    sandbox: true,
    apikey: public_api_key,
    callback: successCallback,
    theme: defaultTheme,
    partnerId: 'AxXxXXxId',
    paymentMethods: ["momo","card"]
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: nColorPrimary,
          title: const Text('Kkiapay Sample'),
          centerTitle: true,
        ),
        body: const KkiapaySample(),
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
            )
          ],
        )
    );
  }
}
