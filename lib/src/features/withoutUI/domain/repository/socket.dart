import 'package:flutter/cupertino.dart';
import 'package:kkiapay_flutter_sdk/src/utils/extension.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import '../../domain/apis/apis.dart';

late IO.Socket mSocket;

class MySocket {
  late Map query;

  final String tag = "MySocket";

  MySocket({Map? mQuery, String? baseUrl}) {
    query = mQuery!;

    try {

      String endPoint =
          baseUrl ??
          Apis.appBaseUrl; //Apis.baseUrlLive;//Secrets.BASE_URL;// Apis.baseUrl;

      mSocket = IO.io(
        endPoint,
        OptionBuilder()
            .setPath("/websocket")
            .enableForceNew()
            .disableReconnection()
            .disableAutoConnect()
            .setQuery(query)
            .setTransports(['websocket'])
            .build(),
      );

      mSocket.on(
        'connect_error',
        (value) => debugPrint("$tag connect_error:: $value"),
      );
      mSocket.on('error', (value) => debugPrint("$tag error:: $value"));
      mSocket.on('safety', (value) => debugPrint("$tag safety:: $value"));
    } catch (e) {
      debugPrint("$tag Failed to init MySocket:: $e ");
    }
  }

  void onPaymentBack(
    Function(bool status, String transactionId, {String? failureCode}) onPaymentBack,
  ) {
    debugPrint("$tag >>> onPaymentBack");
    mSocket.on('payment_back', (data) {
      debugPrint("$tag data:: $data ");
      try {
        debugPrint("$tag data:: $data ");

        if (data["isPaymentSucces"]) {
          onPaymentBack(data["isPaymentSucces"], data["transactionId"]);
        } else {
          onPaymentBack(data["isPaymentSucces"], data["transactionId"], failureCode: data["failureCode"]);
        }
      } catch (e) {
        debugPrint("$tag payment_back:: $e");
      }
      "$data".i(origin: "callbackEvent");
    });
  }

  void onDisconnect(Function() onDisconnect) {
    debugPrint("$tag >>> onDisconnect");
    mSocket.on('disconnect', (value) => debugPrint("$tag connect_error:: $value "));
  }

  void onConnectError(Function() onConnectError) {
    debugPrint("$tag >>> onConnectError");
    mSocket.on('connect_error', (value) => debugPrint("$tag connect_error:: $value "));
  }

  void connect(Function() onConnect) {
    mSocket.on('connect', (_) => onConnect());
    mSocket.connect();
  }

  void onPaymentProcessing(
    Function(Map<String, dynamic> metadata, String status, String transactionId)
    onPaymentProcessing,
  ) {
    debugPrint("$tag >>> payment_processing");
    mSocket.on('payment_processing', (data) {
      try {
        debugPrint("$tag payment_processing data:: $data ");
        onPaymentProcessing(
          data["metadata"],
          data["status"],
          data["transactionId"],
        );
      } catch (e) {
        debugPrint("$tag payment_processing:: $e ");
      }
    });
  }

  void disconnect() {
    debugPrint("$tag >>> disconnect");
    mSocket.disconnect();
  }

  bool isConnected() {
    return mSocket.connected;
  }

}
