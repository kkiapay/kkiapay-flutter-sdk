part of 'widget_builder_view.dart';

class LoadingView extends ViewModelWidget<WidgetBuilderViewModel> {
  LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetBuilderViewModel viewModel) {
    return Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        value: viewModel.progression,
                        backgroundColor: Colors.grey.withOpacity(0.3),
                        color: Colors.grey.withOpacity(0.6),
                      )
                  ),

                  Container(
                      height: 42,
                      child: Center(
                        child: imageFromBase64String(),
                      )),
                ],
              )
            ],
          ),
        ));
  }
}