import '/flutter_flow/flutter_flow_util.dart';
import 'new_testament_chapters_widget.dart' show NewTestamentChaptersWidget;
import 'package:flutter/material.dart';

class NewTestamentChaptersModel
    extends FlutterFlowModel<NewTestamentChaptersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
