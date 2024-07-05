import '/flutter_flow/flutter_flow_util.dart';
import 'old_content_widget.dart' show OldContentWidget;
import 'package:flutter/material.dart';

class OldContentModel extends FlutterFlowModel<OldContentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
