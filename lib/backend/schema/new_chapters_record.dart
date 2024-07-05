import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewChaptersRecord extends FirestoreRecord {
  NewChaptersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "chapter" field.
  int? _chapter;
  int get chapter => _chapter ?? 0;
  bool hasChapter() => _chapter != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _audio = snapshotData['audio'] as String?;
    _chapter = castToType<int>(snapshotData['chapter']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('new-chapters')
          : FirebaseFirestore.instance.collectionGroup('new-chapters');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('new-chapters').doc(id);

  static Stream<NewChaptersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewChaptersRecord.fromSnapshot(s));

  static Future<NewChaptersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewChaptersRecord.fromSnapshot(s));

  static NewChaptersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NewChaptersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewChaptersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewChaptersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewChaptersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewChaptersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewChaptersRecordData({
  String? text,
  String? audio,
  int? chapter,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'audio': audio,
      'chapter': chapter,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewChaptersRecordDocumentEquality implements Equality<NewChaptersRecord> {
  const NewChaptersRecordDocumentEquality();

  @override
  bool equals(NewChaptersRecord? e1, NewChaptersRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.audio == e2?.audio &&
        e1?.chapter == e2?.chapter;
  }

  @override
  int hash(NewChaptersRecord? e) =>
      const ListEquality().hash([e?.text, e?.audio, e?.chapter]);

  @override
  bool isValidKey(Object? o) => o is NewChaptersRecord;
}
