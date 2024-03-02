import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/breadcamp/breadcamp_widget.dart';
import 'assessment_submitted_widget.dart' show AssessmentSubmittedWidget;
import 'package:flutter/material.dart';

class AssessmentSubmittedModel
    extends FlutterFlowModel<AssessmentSubmittedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Breadcamp component.
  late BreadcampModel breadcampModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    breadcampModel = createModel(context, () => BreadcampModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    breadcampModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
