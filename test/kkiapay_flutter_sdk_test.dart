import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kkiapay_flutter_sdk/kkiapay_flutter_sdk_platform_interface.dart';
import 'package:kkiapay_flutter_sdk/kkiapay_flutter_sdk_method_channel.dart';
import 'package:kkiapay_flutter_sdk/src/features/mobile/kkiapay.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKkiapayFlutterSdkPlatform
    with MockPlatformInterfaceMixin
    implements KkiapayFlutterSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future pay(KKiaPay paymentRequest, BuildContext context, Function(dynamic p1, BuildContext p2) callback) {
    // TODO: implement pay
    throw UnimplementedError();
  }
}

void main() {
  final KkiapayFlutterSdkPlatform initialPlatform = KkiapayFlutterSdkPlatform.instance;

  test('$MethodChannelKkiapayFlutterSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKkiapayFlutterSdk>());
  });

  test('getPlatformVersion', () async {
    //KkiapayFlutterSdk kkiapayFlutterSdkPlugin = KkiapayFlutterSdk();
    //MockKkiapayFlutterSdkPlatform fakePlatform = MockKkiapayFlutterSdkPlatform();
    //KkiapayFlutterSdkPlatform.instance = fakePlatform;

    //expect(await kkiapayFlutterSdkPlugin.getPlatformVersion(), '42');
  });
}
