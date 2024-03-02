import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/student_list/student_list_widget.dart';
import 'search_student_bottom_sheet_widget.dart'
    show SearchStudentBottomSheetWidget;
import 'package:flutter/material.dart';

class SearchStudentBottomSheetModel
    extends FlutterFlowModel<SearchStudentBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SearchStudentTextField widget.
  FocusNode? searchStudentTextFieldFocusNode;
  TextEditingController? searchStudentTextFieldController;
  String? Function(BuildContext, String?)?
      searchStudentTextFieldControllerValidator;
  // Model for StudentList component.
  late StudentListModel studentListModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    studentListModel = createModel(context, () => StudentListModel());
  }

  @override
  void dispose() {
    searchStudentTextFieldFocusNode?.dispose();
    searchStudentTextFieldController?.dispose();

    studentListModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
