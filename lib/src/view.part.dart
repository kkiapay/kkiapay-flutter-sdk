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
              Container(
                  height: 52,
                  child: Center(
                    child: imageFromBase64String(),
                  )),
              RichText(
                  text: new TextSpan(
                    style: new TextStyle(
                  fontSize: 18.0,
                ),
                    children: <TextSpan>[
                  new TextSpan(
                      text: 'Chargement',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  new TextSpan(
                      text: viewModel.progression,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54)),
                ],
                  )
              ),
            ],
          ),
        ));
  }
}