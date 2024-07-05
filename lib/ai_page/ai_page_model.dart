import '/flutter_flow/flutter_flow_util.dart';
import 'ai_page_widget.dart' show AiPageWidget;
import 'package:flutter/material.dart';

class AiPageModel extends FlutterFlowModel<AiPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for aitext widget.
  FocusNode? aitextFocusNode;
  TextEditingController? aitextTextController;
  String? Function(BuildContext, String?)? aitextTextControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in IconButton widget.
  String? response;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    aitextFocusNode?.dispose();
    aitextTextController?.dispose();
  }
}
