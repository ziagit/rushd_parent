import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/desktop_appbar/desktop_appbar_widget.dart';
import '/pages/components/mobile_appbar/mobile_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'breadcamp_model.dart';
export 'breadcamp_model.dart';

class BreadcampWidget extends StatefulWidget {
  const BreadcampWidget({super.key});

  @override
  State<BreadcampWidget> createState() => _BreadcampWidgetState();
}

class _BreadcampWidgetState extends State<BreadcampWidget> {
  late BreadcampModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreadcampModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: 80.0,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
          ))
            Expanded(
              child: wrapWithModel(
                model: _model.desktopAppbarModel,
                updateCallback: () => setState(() {}),
                child: const DesktopAppbarWidget(),
              ),
            ),
          if (responsiveVisibility(
            context: context,
            tabletLandscape: false,
            desktop: false,
          ))
            wrapWithModel(
              model: _model.mobileAppbarModel,
              updateCallback: () => setState(() {}),
              child: const MobileAppbarWidget(),
            ),
        ],
      ),
    );
  }
}
