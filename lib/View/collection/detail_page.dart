import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CollectionDetail extends StatefulWidget {
  const CollectionDetail(QueryDocumentSnapshot<Object?> doc, {Key? key})
      : super(key: key);

  @override
  _CollectionDetailState createState() => _CollectionDetailState();
}

class _CollectionDetailState extends State<CollectionDetail> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
