import '/flutter_flow/flutter_flow_util.dart';
import 'new_password_widget.dart' show NewPasswordWidget;
import 'package:flutter/material.dart';

class NewPasswordModel extends FlutterFlowModel<NewPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for NewPasswordField widget.
  FocusNode? newPasswordFieldFocusNode1;
  TextEditingController? newPasswordFieldController1;
  late bool newPasswordFieldVisibility1;
  String? Function(BuildContext, String?)? newPasswordFieldController1Validator;
  // State field(s) for NewPasswordField widget.
  FocusNode? newPasswordFieldFocusNode2;
  TextEditingController? newPasswordFieldController2;
  late bool newPasswordFieldVisibility2;
  String? Function(BuildContext, String?)? newPasswordFieldController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    newPasswordFieldVisibility1 = false;
    newPasswordFieldVisibility2 = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    newPasswordFieldFocusNode1?.dispose();
    newPasswordFieldController1?.dispose();

    newPasswordFieldFocusNode2?.dispose();
    newPasswordFieldController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
