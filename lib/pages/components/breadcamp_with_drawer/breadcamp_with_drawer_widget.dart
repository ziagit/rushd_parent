import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/desktop_appbar/desktop_appbar_widget.dart';
import '/pages/components/mobile_appbar_with_drawer/mobile_appbar_with_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'breadcamp_with_drawer_model.dart';
export 'breadcamp_with_drawer_model.dart';

class BreadcampWithDrawerWidget extends StatefulWidget {
  const BreadcampWithDrawerWidget({super.key});

  @override
  State<BreadcampWithDrawerWidget> createState() =>
      _BreadcampWithDrawerWidgetState();
}

class _BreadcampWithDrawerWidgetState extends State<BreadcampWithDrawerWidget> {
  late BreadcampWithDrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreadcampWithDrawerModel());

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
            tabletLandscape: false,
            desktop: false,
          ))
            wrapWithModel(
              model: _model.mobileAppbarWithDrawerModel,
              updateCallback: () => setState(() {}),
              child: const MobileAppbarWithDrawerWidget(),
            ),
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
        ],
      ),
    );
  }
}
