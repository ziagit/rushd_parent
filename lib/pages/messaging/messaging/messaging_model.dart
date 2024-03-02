import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/breadcamp/breadcamp_widget.dart';
import '/pages/components/desktop_sidebar/desktop_sidebar_widget.dart';
import '/pages/messaging/user_chat_list/user_chat_list_widget.dart';
import 'messaging_widget.dart' show MessagingWidget;
import 'package:flutter/material.dart';

class MessagingModel extends FlutterFlowModel<MessagingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DesktopSidebar component.
  late DesktopSidebarModel desktopSidebarModel;
  // Model for Breadcamp component.
  late BreadcampModel breadcampModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for UserChatList component.
  late UserChatListModel userChatListModel1;
  // Model for UserChatList component.
  late UserChatListModel userChatListModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    desktopSidebarModel = createModel(context, () => DesktopSidebarModel());
    breadcampModel = createModel(context, () => BreadcampModel());
    userChatListModel1 = createModel(context, () => UserChatListModel());
    userChatListModel2 = createModel(context, () => UserChatListModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    desktopSidebarModel.dispose();
    breadcampModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    userChatListModel1.dispose();
    userChatListModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
