import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContentRecord extends FirestoreRecord {
  ContentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  bool hasTopic() => _topic != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "memorize" field.
  String? _memorize;
  String get memorize => _memorize ?? '';
  bool hasMemorize() => _memorize != null;

  // "bible_reading" field.
  String? _bibleReading;
  String get bibleReading => _bibleReading ?? '';
  bool hasBibleReading() => _bibleReading != null;

  // "reflection" field.
  String? _reflection;
  String get reflection => _reflection ?? '';
  bool hasReflection() => _reflection != null;

  // "hymn" field.
  String? _hymn;
  String get hymn => _hymn ?? '';
  bool hasHymn() => _hymn != null;

  // "bible_in_one_year" field.
  String? _bibleInOneYear;
  String get bibleInOneYear => _bibleInOneYear ?? '';
  bool hasBibleInOneYear() => _bibleInOneYear != null;

  // "bible_in_two_year" field.
  String? _bibleInTwoYear;
  String get bibleInTwoYear => _bibleInTwoYear ?? '';
  bool hasBibleInTwoYear() => _bibleInTwoYear != null;

  // "prayer" field.
  String? _prayer;
  String get prayer => _prayer ?? '';
  bool hasPrayer() => _prayer != null;

  // "further_study" field.
  String? _furtherStudy;
  String get furtherStudy => _furtherStudy ?? '';
  bool hasFurtherStudy() => _furtherStudy != null;

  // "key_verse" field.
  String? _keyVerse;
  String get keyVerse => _keyVerse ?? '';
  bool hasKeyVerse() => _keyVerse != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "thought_of_the_day" field.
  String? _thoughtOfTheDay;
  String get thoughtOfTheDay => _thoughtOfTheDay ?? '';
  bool hasThoughtOfTheDay() => _thoughtOfTheDay != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _topic = snapshotData['topic'] as String?;
    _date = snapshotData['date'] as String?;
    _message = snapshotData['message'] as String?;
    _memorize = snapshotData['memorize'] as String?;
    _bibleReading = snapshotData['bible_reading'] as String?;
    _reflection = snapshotData['reflection'] as String?;
    _hymn = snapshotData['hymn'] as String?;
    _bibleInOneYear = snapshotData['bible_in_one_year'] as String?;
    _bibleInTwoYear = snapshotData['bible_in_two_year'] as String?;
    _prayer = snapshotData['prayer'] as String?;
    _furtherStudy = snapshotData['further_study'] as String?;
    _keyVerse = snapshotData['key_verse'] as String?;
    _text = snapshotData['text'] as String?;
    _thoughtOfTheDay = snapshotData['thought_of_the_day'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('content')
          : FirebaseFirestore.instance.collectionGroup('content');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('content').doc(id);

  static Stream<ContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContentRecord.fromSnapshot(s));

  static Future<ContentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContentRecord.fromSnapshot(s));

  static ContentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContentRecordData({
  String? topic,
  String? date,
  String? message,
  String? memorize,
  String? bibleReading,
  String? reflection,
  String? hymn,
  String? bibleInOneYear,
  String? bibleInTwoYear,
  String? prayer,
  String? furtherStudy,
  String? keyVerse,
  String? text,
  String? thoughtOfTheDay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'topic': topic,
      'date': date,
      'message': message,
      'memorize': memorize,
      'bible_reading': bibleReading,
      'reflection': reflection,
      'hymn': hymn,
      'bible_in_one_year': bibleInOneYear,
      'bible_in_two_year': bibleInTwoYear,
      'prayer': prayer,
      'further_study': furtherStudy,
      'key_verse': keyVerse,
      'text': text,
      'thought_of_the_day': thoughtOfTheDay,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContentRecordDocumentEquality implements Equality<ContentRecord> {
  const ContentRecordDocumentEquality();

  @override
  bool equals(ContentRecord? e1, ContentRecord? e2) {
    return e1?.topic == e2?.topic &&
        e1?.date == e2?.date &&
        e1?.message == e2?.message &&
        e1?.memorize == e2?.memorize &&
        e1?.bibleReading == e2?.bibleReading &&
        e1?.reflection == e2?.reflection &&
        e1?.hymn == e2?.hymn &&
        e1?.bibleInOneYear == e2?.bibleInOneYear &&
        e1?.bibleInTwoYear == e2?.bibleInTwoYear &&
        e1?.prayer == e2?.prayer &&
        e1?.furtherStudy == e2?.furtherStudy &&
        e1?.keyVerse == e2?.keyVerse &&
        e1?.text == e2?.text &&
        e1?.thoughtOfTheDay == e2?.thoughtOfTheDay;
  }

  @override
  int hash(ContentRecord? e) => const ListEquality().hash([
        e?.topic,
        e?.date,
        e?.message,
        e?.memorize,
        e?.bibleReading,
        e?.reflection,
        e?.hymn,
        e?.bibleInOneYear,
        e?.bibleInTwoYear,
        e?.prayer,
        e?.furtherStudy,
        e?.keyVerse,
        e?.text,
        e?.thoughtOfTheDay
      ]);

  @override
  bool isValidKey(Object? o) => o is ContentRecord;
}
