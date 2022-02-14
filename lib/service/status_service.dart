import 'package:cloud_firestore/cloud_firestore.dart';

class StatusService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //veri gösterme

  Stream<QuerySnapshot> getFollow() {
    var ref = _firestore.collection("follow").snapshots();
    return ref;
  }

  Stream<QuerySnapshot> getBlog() {
    var ref = _firestore.collection("blog").snapshots();
    return ref;
  }
}
