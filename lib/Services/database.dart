import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseServices{
  String uid='';
  DataBaseServices( {required this.uid});
  final CollectionReference brucollection=FirebaseFirestore.instance.collection('brus');
  Future updateValues(String sugars,String name,int strength) async {
    return await brucollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });

  }
  Stream<QuerySnapshot> get brus{
    return brucollection.snapshots();
  }
}