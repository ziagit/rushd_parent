import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/breadcamp/breadcamp_widget.dart';
import '/pages/components/desktop_sidebar/desktop_sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'porfile_model.dart';
export 'porfile_model.dart';

class PorfileWidget extends StatefulWidget {
  const PorfileWidget({super.key});

  @override
  State<PorfileWidget> createState() => _PorfileWidgetState();
}

class _PorfileWidgetState extends State<PorfileWidget> {
  late PorfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PorfileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                wrapWithModel(
                  model: _model.desktopSidebarModel,
                  updateCallback: () => setState(() {}),
                  child: const DesktopSidebarWidget(),
                ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.breadcampModel,
                              updateCallback: () => setState(() {}),
                              child: const BreadcampWidget(),
                            ),
                            Container(
                              constraints: const BoxConstraints(
                                maxWidth: 600.0,
                              ),
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 6.0, 16.0, 6.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Porfile');
                                            },
                                            child: Container(
                                              width: 235.0,
                                              height: 235.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0x4D9489F5),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: const Color(0xFF98CB73),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          150.0),
                                                  child: Image.network(
                                                    'data:image/jpeg;base64,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',
                                                    width: 300.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '9bewtqhz' /* Your Account */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'vazir',
                                            color: const Color(0xFF57636C),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 1.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('GenralInformation');
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.account_circle_outlined,
                                                color: Color(0xFF57636C),
                                                size: 24.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'gta64l61' /* General infomation */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'vazir',
                                                        color:
                                                            const Color(0xFF57636C),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              const Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Color(0xFF57636C),
                                                    size: 18.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'nymq3fwz' /* App Settings */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'vazir',
                                            color: const Color(0xFF57636C),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('Settings');
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              const Icon(
                                                Icons.settings_sharp,
                                                color: Color(0xFF57636C),
                                                size: 24.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '42a0jxm0' /* Setting */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'vazir',
                                                        color:
                                                            const Color(0xFF57636C),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              const Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Color(0xFF57636C),
                                                    size: 18.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('HelpCenter');
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              const Icon(
                                                Icons.help_outline_rounded,
                                                color: Color(0xFF57636C),
                                                size: 24.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'jjejdyax' /* Support */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'vazir',
                                                        color:
                                                            const Color(0xFF57636C),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              const Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Color(0xFF57636C),
                                                    size: 18.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 3.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const Icon(
                                              Icons.privacy_tip_rounded,
                                              color: Color(0xFF57636C),
                                              size: 24.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '89fodkcq' /* Terms of Service */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'vazir',
                                                          color:
                                                              const Color(0xFF57636C),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                            const Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF57636C),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
