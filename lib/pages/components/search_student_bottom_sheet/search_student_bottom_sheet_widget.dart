import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/student_list/student_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_student_bottom_sheet_model.dart';
export 'search_student_bottom_sheet_model.dart';

class SearchStudentBottomSheetWidget extends StatefulWidget {
  const SearchStudentBottomSheetWidget({super.key});

  @override
  State<SearchStudentBottomSheetWidget> createState() =>
      _SearchStudentBottomSheetWidgetState();
}

class _SearchStudentBottomSheetWidgetState
    extends State<SearchStudentBottomSheetWidget> {
  late SearchStudentBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchStudentBottomSheetModel());

    _model.searchStudentTextFieldController ??= TextEditingController();
    _model.searchStudentTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: 400.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.searchStudentTextFieldController,
                  focusNode: _model.searchStudentTextFieldFocusNode,
                  autofocus: true,
                  autofillHints: const [AutofillHints.email],
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      'v8q8wuys' /* Search student... */,
                    ),
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: const Color(0xFF57636C),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFF1F4F8),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).rushdPrimary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFFF5963),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFFF5963),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: const Color(0xFF101213),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _model.searchStudentTextFieldControllerValidator
                      .asValidator(context),
                ),
              ),
            ),
            wrapWithModel(
              model: _model.studentListModel,
              updateCallback: () => setState(() {}),
              child: const StudentListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
