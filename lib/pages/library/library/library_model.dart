import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/breadcamp_with_drawer/breadcamp_with_drawer_widget.dart';
import '/pages/components/desktop_sidebar/desktop_sidebar_widget.dart';
import '/pages/components/mobile_drawer/mobile_drawer_widget.dart';
import 'library_widget.dart' show LibraryWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class LibraryModel extends FlutterFlowModel<LibraryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DesktopSidebar component.
  late DesktopSidebarModel desktopSidebarModel;
  // Model for BreadcampWithDrawer component.
  late BreadcampWithDrawerModel breadcampWithDrawerModel;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

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
