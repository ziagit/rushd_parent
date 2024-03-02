import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/breadcamp/breadcamp_widget.dart';
import '/pages/library/book_author/book_author_widget.dart';
import 'read_book_widget.dart' show ReadBookWidget;
import 'package:flutter/material.dart';

class ReadBookModel extends FlutterFlowModel<ReadBookWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Breadcamp component.
  late BreadcampModel breadcampModel;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for BookAuthor component.
  late BookAuthorModel bookAuthorModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    breadcampModel = createModel(context, () => BreadcampModel());
    bookAuthorModel = createModel(context, () => BookAuthorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    breadcampModel.dispose();
    bookAuthorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
