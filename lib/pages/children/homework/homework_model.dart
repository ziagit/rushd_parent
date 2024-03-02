import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/breadcamp/breadcamp_widget.dart';
import 'homework_widget.dart' show HomeworkWidget;
import 'package:flutter/material.dart';

class HomeworkModel extends FlutterFlowModel<HomeworkWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Breadcamp component.
  late BreadcampModel breadcampModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

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
