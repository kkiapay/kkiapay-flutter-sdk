import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kkiapay_flutter_sdk/kkiapay/view/view.part.dart';
import 'package:stacked/stacked.dart';
import '../../utils/kkiapayConf.sample.dart';
import '../../utils/utils.dart';
import 'widget_builder_view_model.dart';
import 'dart:io';

class KKiaPay extends StackedView<WidgetBuilderViewModel> {
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
  final List<String>? countries;
  final String? partnerId;
  final List<String>? paymentMethods;

  const KKiaPay({
    Key? key,
    required this.amount,
    required this.apikey,
    required this.callback,
    this.phone,
    this.partnerId,
    this.countries,
    this.reason,
    this.data,
    this.paymentMethods,
    this.sandbox,
    this.theme,
    this.name,
    this.email,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, WidgetBuilderViewModel viewModel, Widget? child) {
    return Scaffold(
        backgroundColor: Color(Utils.getColorFromHex(theme ?? defaultTheme)),

        /// Show AppBar on IOS
        appBar: Platform.isIOS
            ? AppBar(
                backgroundColor:
                    Color(Utils.getColorFromHex(theme ?? defaultTheme)),
              )
            : null,
        body: Stack(
          children: [
            Container(
              margin: Platform.isIOS
                  ? null
                  : EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top),
              child: viewModel.hide
                  ? null
                  : WidgetBuild(
                      url: Utils.getUrl(SdkData(
                          reason: reason,
                          amount: amount,
                          paymentMethod: paymentMethods,
                          partnerId: partnerId,
                          countries: countries,
                          phone: phone,
                          data: data,
                          sandbox: sandbox,
                          apikey: apikey,
                          theme: theme,
                          name: name,
                          email: email)),
                      callback: callback),
            ),
            if (viewModel.onLoading) LoadingView(),
          ],
        ));
  }

  @override
  void onViewModelReady(WidgetBuilderViewModel viewModel) {
    super.onViewModelReady(viewModel);
    if (!Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light));
    }
    viewModel.setData({
      'countries': countries,
      'partnerId': partnerId,
      'amount': amount,
      'reason': reason,
      'phone': phone,
      'data': data,
      'paymentMethods': paymentMethods,
      'sandbox': sandbox,
      'name': name,
      'email': email
    });
  }

  @override
  WidgetBuilderViewModel viewModelBuilder(BuildContext context) {
    return WidgetBuilderViewModel();
  }
}
