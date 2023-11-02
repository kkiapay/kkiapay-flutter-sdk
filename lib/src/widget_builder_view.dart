import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kkiapay_flutter_sdk/src/view.part.dart';
import 'package:stacked/stacked.dart';
import '../../utils/config.dart';
import '../../utils/utils.dart';
import 'widget_builder_view_model.dart';
import 'dart:io';

class KKiaPay extends StackedView<WidgetBuilderViewModel> {

  /* Payment info */
  /// @Params: Payment amount
  /// Ex : 1000
  final int amount;
  /// @Params : Payment reason
  /// Ex : "transaction reason"
  final String reason;
  /// @Params : Payment phoneNumber
  /// Ex : "22961000000"
  final String? phone;
  /// @Params : Payment owner
  /// Ex : "John Doe"
  final String? name;
  /// @Params email : Payment owner address mail
  /// Ex : "email@mail.com"
  final String? email;
  /// @Params : Payment data send by webhook
  /// Ex : 'Big data'
  final String? data;
  /// @Params partnerId : Your application payment reference
  /// Ex : 'AxXxXXxId'
  final String? partnerId;
  /// @Params : Payment callback
  final Function(Map<String, dynamic>, BuildContext) callback;


  /* Widget ui config */
  /// @Params : Your public api key according to [sandbox] value
  /// Ex : XXXX_public_api_key_XXX
  final String apikey;
  /// @Params : Payment environment according to [apikey] value
  /// Ex : true
  final bool? sandbox;
  /// @Params : Widget UI theme
  /// Ex : "#222F5A"
  final String? theme;
  /// @Params : Widget authorized countries
  /// Ex : ["CI"]
  final List<String>? countries;
  /// @Params : Widget authorized payment paymentMethods
  /// Ex : ["momo","card"]
  final List<String>? paymentMethods;


  const KKiaPay({
    Key? key,
    /* Payment info */
    required this.amount,
    required this.reason,
    this.phone,
    this.name,
    this.email,
    this.data,
    this.partnerId,
    required this.callback,
    /* Widget ui config */
    required this.apikey,
    required this.sandbox,
    this.theme,
    this.countries,
    this.paymentMethods,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, WidgetBuilderViewModel viewModel, Widget? child) {
    return Scaffold(
        backgroundColor: Color(Utils.getColorFromHex(theme ?? defaultTheme)),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top),
              child: viewModel.onLoading ? null
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

    /// Change status bar if ios devise
    if (!Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light));
    }

    /// Initialise javascript event history
    viewModel.setLastEvent("");

    /// Save payment data for callback
    viewModel.setData({
      'amount': amount,
      'reason': reason,
      'phone': phone,
      'name': name,
      'email': email,
      'partnerId': partnerId,
      'data': data,
      'sandbox': sandbox,
    });
  }

  @override
  WidgetBuilderViewModel viewModelBuilder(BuildContext context) {
    return WidgetBuilderViewModel();
  }

}
