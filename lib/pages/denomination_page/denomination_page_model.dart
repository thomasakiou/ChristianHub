import '/flutter_flow/flutter_flow_util.dart';
import 'denomination_page_widget.dart' show DenominationPageWidget;
import 'package:flutter/material.dart';

class DenominationPageModel extends FlutterFlowModel<DenominationPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
