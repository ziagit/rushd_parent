import '/flutter_flow/flutter_flow_util.dart';
import '/pages/activity/activity_component/activity_component_widget.dart';
import '/pages/components/breadcamp/breadcamp_widget.dart';
import 'activities_widget.dart' show ActivitiesWidget;
import 'package:flutter/material.dart';

class ActivitiesModel extends FlutterFlowModel<ActivitiesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Breadcamp component.
  late BreadcampModel breadcampModel;
  // Model for ActivityComponent component.
  late ActivityComponentModel activityComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    breadcampModel = createModel(context, () => BreadcampModel());
    activityComponentModel =
        createModel(context, () => ActivityComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    breadcampModel.dispose();
    activityComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
