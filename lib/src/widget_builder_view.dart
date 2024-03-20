import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/utils/utils.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../utils/config.dart';
import 'widget_builder_view_model.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'dart:io';
part 'view.part.dart';

class KKiaPay extends StatefulWidget {
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

  /// @Params : Payment callback
  final String? callbackUrl;

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
    this.callbackUrl,
    /* Widget ui config */
    required this.apikey,
    required this.sandbox,
    this.theme,
    this.countries,
    this.paymentMethods,
  }) : super(key: key);

  @override
  State<KKiaPay> createState() => _KKiaPayState();
}

class _KKiaPayState extends State<KKiaPay> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(Utils.getUrl(SdkData(
          reason: widget.reason,
          amount: widget.amount,
          paymentMethod: widget.paymentMethods,
          partnerId: widget.partnerId,
          countries: widget.countries,
          phone: widget.phone,
          data: widget.data,
          sandbox: widget.sandbox,
          apikey: widget.apikey,
          theme: widget.theme,
          callbackUrl: widget.callbackUrl,
          name: widget.name,
          email: widget.email ) )
      ));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WidgetBuilderViewModel>.reactive(
      onViewModelReady: (viewModel) {

        _controller
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                debugPrint('WebView is loading (progress : $progress%)');
                viewModel.setProgression(progress/100);
              },
              onPageStarted: (String url) {
                debugPrint('Page started loading: $url');
                viewModel.loadingStart();
              },
              onPageFinished: (String url) {
                debugPrint('Page finished loading: $url');
                viewModel.loadingFinish();
              },
              onWebResourceError: (WebResourceError error) {
                debugPrint('''
            Page resource error:
            code: ${error.errorCode}
            description: ${error.description}
            errorType: ${error.errorType}
            isForMainFrame: ${error.isForMainFrame}
            ''');
              },
              onUrlChange: (UrlChange change) {
                viewModel.onUrlChange( change, context);
              },
            ),
          )
          ..addJavaScriptChannel('SDK_CHANNEL', onMessageReceived: (message) {
          print( JsonDecoder().convert(message.message));

          switch (JsonDecoder().convert(message.message)["name"]) {

            case CLOSE_WIDGET:
              if (viewModel.lastEvent != PAYMENT_SUCCESS)
              widget.callback( {
                'requestData': viewModel.data,
                'transactionId': null,
                'status': CallbackStatus.PAYMENT_CANCELLED.name
              }, context);
              break;

            case WIDGET_SUCCESSFULLY_INIT:
              viewModel.loadingFinish();
              break;

            case PAYMENT_INIT:
              if (viewModel.lastEvent != PAYMENT_SUCCESS)
              widget.callback({
                'requestData': viewModel.data,
                'transactionId': null,
                'status': CallbackStatus.PAYMENT_INIT.name
              },context);
              break;

            case PENDING_PAYMENT:
              viewModel.isBusy;
              break;

            case PAYMENT_SUCCESS:
              viewModel.setLastEvent(PAYMENT_SUCCESS);
              widget.callback( {
                'requestData': viewModel.data,
                'transactionId': JsonDecoder().convert(message.message)["data"]["transactionId"],
                'status': CallbackStatus.PAYMENT_SUCCESS.name
              }, context);
              break;

            case PAYMENT_FAILED: widget.callback( {
              'requestData': null,
              'transactionId': JsonDecoder().convert(message.message)["data"]["transactionId"],
              'status': CallbackStatus.PAYMENT_FAILED.name
            }, context);
            break;

            case WAVE_LINK:
             Utils.launchWave(
               JsonDecoder().convert(message.message)["data"],);
              break;

            default:
              break;
          }
        });

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
          'amount': widget.amount,
          'reason': widget.reason,
          'phone': widget.phone,
          'name': widget.name,
          'email': widget.email,
          'partnerId': widget.partnerId,
          'data': widget.data,
          'sandbox': widget.sandbox,
        });
      },
      builder: (context, viewModel, child) => Scaffold(
          backgroundColor: Color(Utils.getColorFromHex(widget.theme ?? defaultTheme)),
          body: Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top),
                  child: viewModel.onLoading
                      ? null
                      : WebViewWidget(controller: _controller)),
              if (viewModel.onLoading) LoadingView(),
            ],
          )),
      viewModelBuilder: () => WidgetBuilderViewModel(),
    );
  }
}
