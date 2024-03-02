import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/breadcamp_with_drawer/breadcamp_with_drawer_widget.dart';
import '/pages/components/desktop_sidebar/desktop_sidebar_widget.dart';
import '/pages/components/mobile_drawer/mobile_drawer_widget.dart';
import 'children_widget.dart' show ChildrenWidget;
import 'package:flutter/material.dart';

class ChildrenModel extends FlutterFlowModel<ChildrenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DesktopSidebar component.
  late DesktopSidebarModel desktopSidebarModel;
  // Model for BreadcampWithDrawer component.
  late BreadcampWithDrawerModel breadcampWithDrawerModel;
  // Model for MobileDrawer component.
  late MobileDrawerModel mobileDrawerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    desktopSidebarModel = createModel(context, () => DesktopSidebarModel());
    breadcampWithDrawerModel =
        createModel(context, () => BreadcampWithDrawerModel());
    mobileDrawerModel = createModel(context, () => MobileDrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    desktopSidebarModel.dispose();
    breadcampWithDrawerModel.dispose();
    mobileDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
