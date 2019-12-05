import 'package:flutter/material.dart';
import 'package:webview_project/successScreen.dart';

void sucessCallback(amount, context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => SuccessScreen(
              amount: amount,
            )),
  );
}
