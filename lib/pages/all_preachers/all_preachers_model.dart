import '/flutter_flow/flutter_flow_util.dart';
import 'all_preachers_widget.dart' show AllPreachersWidget;
import 'package:flutter/material.dart';

class AllPreachersModel extends FlutterFlowModel<AllPreachersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
