import 'package:flutter/material.dart';
import 'package:webview_project/successScree.dart';

Function sucessCallback(amount, context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => SuccessScreen(
              amount: amount,
            )),
  );
}
