import '/flutter_flow/flutter_flow_util.dart';
import 'old_testament_widget.dart' show OldTestamentWidget;
import 'package:flutter/material.dart';

class OldTestamentModel extends FlutterFlowModel<OldTestamentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
