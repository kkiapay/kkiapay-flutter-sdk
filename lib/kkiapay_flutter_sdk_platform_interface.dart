import 'package:flutter/cupertino.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'kkiapay_flutter_sdk.dart';
import 'kkiapay_flutter_sdk_method_channel.dart';

abstract class KkiapayFlutterSdkPlatform extends PlatformInterface {
  /// Constructs a KkiapayFlutterSdkPlatform.
  KkiapayFlutterSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static KkiapayFlutterSdkPlatform _instance = MethodChannelKkiapayFlutterSdk();

  /// The default instance of [KkiapayFlutterSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelKkiapayFlutterSdk].
  static KkiapayFlutterSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KkiapayFlutterSdkPlatform] when
  /// they register themselves.
  static set instance(KkiapayFlutterSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Init kkiapay payment interface
  Future pay (KKiaPay paymentRequest, BuildContext context, Function(dynamic, BuildContext) callback) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

}
