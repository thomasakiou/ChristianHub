import '/flutter_flow/flutter_flow_util.dart';
import 'new_content_widget.dart' show NewContentWidget;
import 'package:flutter/material.dart';

class NewContentModel extends FlutterFlowModel<NewContentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
