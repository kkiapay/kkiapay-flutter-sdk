import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/kkiapay_flutter_sdk.dart';
import 'success_screen.dart';

void main() => runApp(const App());

void callback(response, context) {
  switch (response['status']) {
    case PAYMENT_CANCELLED:
      debugPrint(PAYMENT_CANCELLED);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(PAYMENT_CANCELLED),
      ));
      break;

    case PENDING_PAYMENT:
      debugPrint(PENDING_PAYMENT);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(PENDING_PAYMENT),
      ));
      break;

    case PAYMENT_INIT:
      debugPrint(PAYMENT_INIT);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(PAYMENT_INIT),
      ));
      break;

    case PAYMENT_SUCCESS:
      debugPrint(PAYMENT_SUCCESS);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(PAYMENT_SUCCESS),
      ));
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

    case PAYMENT_FAILED:
      debugPrint(PAYMENT_FAILED);
      Navigator.pop(context);
      break;

    default:
      debugPrint(UNKNOWN_EVENT);
      break;
  }
}

const kkiapay = KKiaPay(
    amount: 1000,
    countries: ["BJ","CI","SN","TG"],
    phone: "22961000000",
    name: "John Doe",
    email: "email@mail.com",
    reason: 'transaction reason',
    data: 'Fake data',
    sandbox: false,
    apikey: public_api_key,
    callback: callback,
    theme: defaultTheme,
    partnerId: 'AxXxXXxId',
    paymentMethods: ["momo", "card"]);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
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
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff222F5A)),
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
    ));
  }
}
