import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/breadcamp/breadcamp_widget.dart';
import 'read_course_widget.dart' show ReadCourseWidget;
import 'package:flutter/material.dart';

class ReadCourseModel extends FlutterFlowModel<ReadCourseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Breadcamp component.
  late BreadcampModel breadcampModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    breadcampModel = createModel(context, () => BreadcampModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    breadcampModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
