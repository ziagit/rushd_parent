import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/notification_bell/notification_bell_widget.dart';
import 'mobile_appbar_with_drawer_widget.dart'
    show MobileAppbarWithDrawerWidget;
import 'package:flutter/material.dart';

class MobileAppbarWithDrawerModel
    extends FlutterFlowModel<MobileAppbarWithDrawerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for NotificationBell component.
  late NotificationBellModel notificationBellModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    notificationBellModel = createModel(context, () => NotificationBellModel());
  }

  @override
  void dispose() {
    notificationBellModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
