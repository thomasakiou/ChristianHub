import '/flutter_flow/flutter_flow_util.dart';
import 'devotionals_widget.dart' show DevotionalsWidget;
import 'package:flutter/material.dart';

class DevotionalsModel extends FlutterFlowModel<DevotionalsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
