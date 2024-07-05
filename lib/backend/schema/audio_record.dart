import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AudioRecord extends FirestoreRecord {
  AudioRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "file" field.
  String? _file;
  String get file => _file ?? '';
  bool hasFile() => _file != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _file = snapshotData['file'] as String?;
    _title = snapshotData['title'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('audio')
          : FirebaseFirestore.instance.collectionGroup('audio');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('audio').doc(id);

  static Stream<AudioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AudioRecord.fromSnapshot(s));

  static Future<AudioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AudioRecord.fromSnapshot(s));

  static AudioRecord fromSnapshot(DocumentSnapshot snapshot) => AudioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AudioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AudioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AudioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AudioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAudioRecordData({
  String? file,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'file': file,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class AudioRecordDocumentEquality implements Equality<AudioRecord> {
  const AudioRecordDocumentEquality();

  @override
  bool equals(AudioRecord? e1, AudioRecord? e2) {
    return e1?.file == e2?.file && e1?.title == e2?.title;
  }

  @override
  int hash(AudioRecord? e) => const ListEquality().hash([e?.file, e?.title]);

  @override
  bool isValidKey(Object? o) => o is AudioRecord;
}
