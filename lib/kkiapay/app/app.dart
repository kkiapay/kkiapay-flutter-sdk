import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../view/widget_builder_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: KKiaPay),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
  ],
)
class App {
  // Serves no purpose but for annotations to work
}
