import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/desktop_appbar/desktop_appbar_widget.dart';
import '/pages/components/mobile_appbar/mobile_appbar_widget.dart';
import 'breadcamp_widget.dart' show BreadcampWidget;
import 'package:flutter/material.dart';

class BreadcampModel extends FlutterFlowModel<BreadcampWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for DesktopAppbar component.
  late DesktopAppbarModel desktopAppbarModel;
  // Model for MobileAppbar component.
  late MobileAppbarModel mobileAppbarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    desktopAppbarModel = createModel(context, () => DesktopAppbarModel());
    mobileAppbarModel = createModel(context, () => MobileAppbarModel());
  }

  @override
  void dispose() {
    desktopAppbarModel.dispose();
    mobileAppbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
