import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kkiapay_flutter_sdk/kkiapay/view/view.part.dart';
import 'package:stacked/stacked.dart';
import '../../utils/kkiapayConf.sample.dart';
import '../../utils/utils.dart';
import 'widget_builder_view_model.dart';
import 'dart:io';


class KKiaPay extends StatefulWidget {

  final int amount;
  final String? reason;
  final String? phone;
  final String? data;
  final String? apikey;
  final bool? sandbox;
  final Function(Map<String, dynamic>, BuildContext) callback;
  final String? theme;
  final String? name;
  final String? email;
  final PaymentMethod? paymentMethod;


  const KKiaPay({
    Key? key,
    required this.amount ,
    required this.apikey,
    required this.callback,
    this.phone,
    this.data,
    this.reason,
    this.paymentMethod,
    this.sandbox,
    this.theme,
    this.name,
    this.email,
  }) : super(key: key);



  @override
  _KKiaPayState createState() => _KKiaPayState(
    this.amount ,
    this.phone,
    this.data,
    this.reason,
    this.paymentMethod,
    this.sandbox,
    this.apikey,
    this.callback,
    this.theme,
    this.name,
    this.email,
  );

}



class _KKiaPayState extends State<KKiaPay> with SingleTickerProviderStateMixin {

  final int amount;
  final String? phone;
  final String? reason;
  final String? data;
  final String? apikey;
  final bool? sandbox;
  final Function(Map<String, dynamic>, BuildContext) callback;
  final String? theme;
  final String? name;
  final String? email;
  final PaymentMethod? paymentMethod;



  _KKiaPayState(
      this.amount ,
    this.phone, 
    this.reason,
    this.data,
    this.paymentMethod,
    this.sandbox, 
    this.apikey,
      this.callback,
    this.theme, 
    this.name,
    this.email,
  );


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WidgetBuilderViewModel>.reactive(
      onModelReady: (model) {
        Platform.isIOS ? null : SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light
        ));
        model.setData ({
          'amount':amount,
          'reason': reason,
          'phone': phone,
          'data': data,
          'paymentMethod': paymentMethod,
          'sandbox': sandbox,
          'name':name,
          'email': email
        });
      },
      builder: (context, model, child) =>  Scaffold(
        backgroundColor: Color(Utils.getColorFromHex(theme ?? defaultTheme)),
        /// Show AppBar on IOS
        appBar: Platform.isIOS ? AppBar(
          backgroundColor: Color(Utils.getColorFromHex(theme ?? defaultTheme)),
        ) : null,
        body:  Stack(
          children: [
            Container (
              margin:  Platform.isIOS ? null : EdgeInsets.only( top: MediaQuery.of(context).viewPadding.top),
              child: model.hide ? null : WidgetBuild (
                  url: Utils.getUrl( SdkData(
                      reason: this.reason, amount: this.amount,
                      paymentMethod: this.paymentMethod == null  ? null : [ this.paymentMethod?.name ],
                      phone: this.phone, data: this.data, sandbox: this.sandbox,
                      apikey: this.apikey, theme: this.theme, name: this.name, email: this.email
                  ) ),
                  callback: callback
              ),
            ),
            SizedBox(
              child: model.onLoading ? LoadingView() : null,
            )
          ],
        )
      ),
      viewModelBuilder: () => WidgetBuilderViewModel(),
    );
  }



}
