
import 'package:kkiapay_flutter_sdk/src/features/withoutUI/methods/momo_payment_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../features/withUI/mobile/kkiapay.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: KKiaPay),
  ],
  dependencies: [
    LazySingleton(classType: MoMoPaymentService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
  ],
)
class App {
  // Serves no purpose but for annotations to work
}
