import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DevotionalRecord extends FirestoreRecord {
  DevotionalRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('devotional');

  static Stream<DevotionalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DevotionalRecord.fromSnapshot(s));

  static Future<DevotionalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DevotionalRecord.fromSnapshot(s));

  static DevotionalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DevotionalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DevotionalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DevotionalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DevotionalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DevotionalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDevotionalRecordData({
  String? name,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class DevotionalRecordDocumentEquality implements Equality<DevotionalRecord> {
  const DevotionalRecordDocumentEquality();

  @override
  bool equals(DevotionalRecord? e1, DevotionalRecord? e2) {
    return e1?.name == e2?.name && e1?.image == e2?.image;
  }

  @override
  int hash(DevotionalRecord? e) =>
      const ListEquality().hash([e?.name, e?.image]);

  @override
  bool isValidKey(Object? o) => o is DevotionalRecord;
}
