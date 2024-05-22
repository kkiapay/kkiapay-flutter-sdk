import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'kkiapay_flutter_sdk_platform_interface.dart';

/// An implementation of [KkiapayFlutterSdkPlatform] that uses method channels.
class MethodChannelKkiapayFlutterSdk extends KkiapayFlutterSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('kkiapay_flutter_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
