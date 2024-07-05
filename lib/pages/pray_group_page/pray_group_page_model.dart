import '/flutter_flow/flutter_flow_util.dart';
import 'pray_group_page_widget.dart' show PrayGroupPageWidget;
import 'package:flutter/material.dart';

class PrayGroupPageModel extends FlutterFlowModel<PrayGroupPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
