import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final int? amount;
  final String? transactionId;

  const SuccessScreen({super.key, this.amount, this.transactionId});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PAYMENT SUCCESSFUL'),
        ),
        body: Center(
          child: Text(
            "Votre paiement de $amount Fcfa a été recu avec succès et l'ID de la transaction est $transactionId",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
