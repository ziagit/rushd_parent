import '/flutter_flow/flutter_flow_util.dart';
import 'verifiation_code_widget.dart' show VerifiationCodeWidget;
import 'package:flutter/material.dart';

class VerifiationCodeModel extends FlutterFlowModel<VerifiationCodeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RessetPasswordCode widget.
  FocusNode? ressetPasswordCodeFocusNode;
  TextEditingController? ressetPasswordCodeController;
  String? Function(BuildContext, String?)?
      ressetPasswordCodeControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    ressetPasswordCodeFocusNode?.dispose();
    ressetPasswordCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
