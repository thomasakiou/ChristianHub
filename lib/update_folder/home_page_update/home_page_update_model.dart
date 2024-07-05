import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_update_widget.dart' show HomePageUpdateWidget;
import 'package:flutter/material.dart';

class HomePageUpdateModel extends FlutterFlowModel<HomePageUpdateWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
