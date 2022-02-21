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

  Stream<QuerySnapshot> getContact() {
    var ref = _firestore.collection("contact").snapshots();
    return ref;
  }

  Stream<QuerySnapshot> getProducts() {
    var ref = _firestore.collection("products").snapshots();
    return ref;
  }

  Stream<QuerySnapshot> getAbout() {
    var ref = _firestore.collection("about").snapshots();
    return ref;
  }

  Stream<QuerySnapshot> getCollection() {
    var ref = _firestore.collection("collection").snapshots();
    return ref;
  }

  Stream<QuerySnapshot> getContactUs() {
    var ref = _firestore.collection("contactus").snapshots();
    return ref;
  }
}
