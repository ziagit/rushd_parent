import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/breadcamp/breadcamp_widget.dart';
import 'take_assessment_widget.dart' show TakeAssessmentWidget;
import 'package:flutter/material.dart';

class TakeAssessmentModel extends FlutterFlowModel<TakeAssessmentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Breadcamp component.
  late BreadcampModel breadcampModel;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

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

  String? get radioButtonValue => radioButtonValueController?.value;
}
