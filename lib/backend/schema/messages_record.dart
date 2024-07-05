import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "preacher_name" field.
  String? _preacherName;
  String get preacherName => _preacherName ?? '';
  bool hasPreacherName() => _preacherName != null;

  // "preacher_image" field.
  String? _preacherImage;
  String get preacherImage => _preacherImage ?? '';
  bool hasPreacherImage() => _preacherImage != null;

  void _initializeFields() {
    _preacherName = snapshotData['preacher_name'] as String?;
    _preacherImage = snapshotData['preacher_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  String? preacherName,
  String? preacherImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'preacher_name': preacherName,
      'preacher_image': preacherImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.preacherName == e2?.preacherName &&
        e1?.preacherImage == e2?.preacherImage;
  }

  @override
  int hash(MessagesRecord? e) =>
      const ListEquality().hash([e?.preacherName, e?.preacherImage]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
