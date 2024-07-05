import '/flutter_flow/flutter_flow_util.dart';
import 'study_group_page_widget.dart' show StudyGroupPageWidget;
import 'package:flutter/material.dart';

class StudyGroupPageModel extends FlutterFlowModel<StudyGroupPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
