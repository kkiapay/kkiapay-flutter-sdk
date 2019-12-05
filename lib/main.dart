import 'package:flutter/material.dart';
import 'package:webview_project/kkiapayWebview.dart';

void main() => runApp(App());

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
              MaterialPageRoute(builder: (context) => KkiapayWebview()),
            );
          },
        ),
      ),
    );
  }
}
