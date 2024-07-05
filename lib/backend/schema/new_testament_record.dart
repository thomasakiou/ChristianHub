import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewTestamentRecord extends FirestoreRecord {
  NewTestamentRecord._(
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
      FirebaseFirestore.instance.collection('new-testament');

  static Stream<NewTestamentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewTestamentRecord.fromSnapshot(s));

  static Future<NewTestamentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewTestamentRecord.fromSnapshot(s));

  static NewTestamentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NewTestamentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewTestamentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewTestamentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewTestamentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewTestamentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewTestamentRecordData({
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

class NewTestamentRecordDocumentEquality
    implements Equality<NewTestamentRecord> {
  const NewTestamentRecordDocumentEquality();

  @override
  bool equals(NewTestamentRecord? e1, NewTestamentRecord? e2) {
    return e1?.books == e2?.books && e1?.index == e2?.index;
  }

  @override
  int hash(NewTestamentRecord? e) =>
      const ListEquality().hash([e?.books, e?.index]);

  @override
  bool isValidKey(Object? o) => o is NewTestamentRecord;
}
