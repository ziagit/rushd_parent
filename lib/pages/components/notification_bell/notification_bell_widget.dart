import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notification_bell_model.dart';
export 'notification_bell_model.dart';

class NotificationBellWidget extends StatefulWidget {
  const NotificationBellWidget({super.key});

  @override
  State<NotificationBellWidget> createState() => _NotificationBellWidgetState();
}

class _NotificationBellWidgetState extends State<NotificationBellWidget> {
  late NotificationBellModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationBellModel());

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

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: badges.Badge(
        badgeContent: Text(
          FFLocalizations.of(context).getText(
            'y741u8l3' /* 1 */,
          ),
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'vazir',
                color: Colors.white,
                fontSize: 8.0,
                useGoogleFonts: false,
              ),
        ),
        showBadge: true,
        shape: badges.BadgeShape.circle,
        badgeColor: FlutterFlowTheme.of(context).error,
        elevation: 4.0,
        padding: const EdgeInsets.all(6.0),
        position: badges.BadgePosition.topEnd(),
        animationType: badges.BadgeAnimationType.scale,
        toAnimate: true,
        child: Icon(
          Icons.notifications_rounded,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
      ),
    );
  }
}
