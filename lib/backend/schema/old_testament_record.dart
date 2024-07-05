import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OldTestamentRecord extends FirestoreRecord {
  OldTestamentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "books" field.
  String? _books;
  String get books => _books ?? '';
  bool hasBooks() => _books != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  void _initializeFields() {
    _books = snapshotData['books'] as String?;
    _index = castToType<int>(snapshotData['index']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('old-testament');

  static Stream<OldTestamentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OldTestamentRecord.fromSnapshot(s));

  static Future<OldTestamentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OldTestamentRecord.fromSnapshot(s));

  static OldTestamentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OldTestamentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OldTestamentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OldTestamentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OldTestamentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OldTestamentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOldTestamentRecordData({
  String? books,
  int? index,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'books': books,
      'index': index,
    }.withoutNulls,
  );

  return firestoreData;
}

class OldTestamentRecordDocumentEquality
    implements Equality<OldTestamentRecord> {
  const OldTestamentRecordDocumentEquality();

  @override
  bool equals(OldTestamentRecord? e1, OldTestamentRecord? e2) {
    return e1?.books == e2?.books && e1?.index == e2?.index;
  }

  @override
  int hash(OldTestamentRecord? e) =>
      const ListEquality().hash([e?.books, e?.index]);

  @override
  bool isValidKey(Object? o) => o is OldTestamentRecord;
}
