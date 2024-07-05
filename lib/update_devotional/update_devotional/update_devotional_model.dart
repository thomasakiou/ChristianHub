import '/flutter_flow/flutter_flow_util.dart';
import 'update_devotional_widget.dart' show UpdateDevotionalWidget;
import 'package:flutter/material.dart';

class UpdateDevotionalModel extends FlutterFlowModel<UpdateDevotionalWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for topic widget.
  FocusNode? topicFocusNode;
  TextEditingController? topicTextController;
  String? Function(BuildContext, String?)? topicTextControllerValidator;
  // State field(s) for date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  String? Function(BuildContext, String?)? dateTextControllerValidator;
  // State field(s) for message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageTextController;
  String? Function(BuildContext, String?)? messageTextControllerValidator;
  // State field(s) for prayer widget.
  FocusNode? prayerFocusNode;
  TextEditingController? prayerTextController;
  String? Function(BuildContext, String?)? prayerTextControllerValidator;
  // State field(s) for bible-reading widget.
  FocusNode? bibleReadingFocusNode;
  TextEditingController? bibleReadingTextController;
  String? Function(BuildContext, String?)? bibleReadingTextControllerValidator;
  // State field(s) for memorize widget.
  FocusNode? memorizeFocusNode;
  TextEditingController? memorizeTextController;
  String? Function(BuildContext, String?)? memorizeTextControllerValidator;
  // State field(s) for reflection widget.
  FocusNode? reflectionFocusNode;
  TextEditingController? reflectionTextController;
  String? Function(BuildContext, String?)? reflectionTextControllerValidator;
  // State field(s) for key-verse widget.
  FocusNode? keyVerseFocusNode;
  TextEditingController? keyVerseTextController;
  String? Function(BuildContext, String?)? keyVerseTextControllerValidator;
  // State field(s) for text widget.
  FocusNode? textFocusNode;
  TextEditingController? textTextController;
  String? Function(BuildContext, String?)? textTextControllerValidator;
  // State field(s) for hymn widget.
  FocusNode? hymnFocusNode;
  TextEditingController? hymnTextController;
  String? Function(BuildContext, String?)? hymnTextControllerValidator;
  // State field(s) for furtherstudy widget.
  FocusNode? furtherstudyFocusNode;
  TextEditingController? furtherstudyTextController;
  String? Function(BuildContext, String?)? furtherstudyTextControllerValidator;
  // State field(s) for bible-in-1-yr widget.
  FocusNode? bibleIn1YrFocusNode;
  TextEditingController? bibleIn1YrTextController;
  String? Function(BuildContext, String?)? bibleIn1YrTextControllerValidator;
  // State field(s) for bible-in-2-yrs widget.
  FocusNode? bibleIn2YrsFocusNode;
  TextEditingController? bibleIn2YrsTextController;
  String? Function(BuildContext, String?)? bibleIn2YrsTextControllerValidator;
  // State field(s) for thought-of-day widget.
  FocusNode? thoughtOfDayFocusNode;
  TextEditingController? thoughtOfDayTextController;
  String? Function(BuildContext, String?)? thoughtOfDayTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    topicFocusNode?.dispose();
    topicTextController?.dispose();

    dateFocusNode?.dispose();
    dateTextController?.dispose();

    messageFocusNode?.dispose();
    messageTextController?.dispose();

    prayerFocusNode?.dispose();
    prayerTextController?.dispose();

    bibleReadingFocusNode?.dispose();
    bibleReadingTextController?.dispose();

    memorizeFocusNode?.dispose();
    memorizeTextController?.dispose();

    reflectionFocusNode?.dispose();
    reflectionTextController?.dispose();

    keyVerseFocusNode?.dispose();
    keyVerseTextController?.dispose();

    textFocusNode?.dispose();
    textTextController?.dispose();

    hymnFocusNode?.dispose();
    hymnTextController?.dispose();

    furtherstudyFocusNode?.dispose();
    furtherstudyTextController?.dispose();

    bibleIn1YrFocusNode?.dispose();
    bibleIn1YrTextController?.dispose();

    bibleIn2YrsFocusNode?.dispose();
    bibleIn2YrsTextController?.dispose();

    thoughtOfDayFocusNode?.dispose();
    thoughtOfDayTextController?.dispose();
  }
}
