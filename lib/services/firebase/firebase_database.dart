import 'package:chatbox/logic/models/room_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireData {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final String myUid = FirebaseAuth.instance.currentUser!.uid;
  creatRoom(String email) async {
    QuerySnapshot userEmail = await firebaseFirestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    String userId = userEmail.docs.first.id;
    List<String> members = [myUid, userId];
    RoomModel roomModel = RoomModel(
      members: members,
      id: userId,
      createdAt: DateTime.now().toString(),
      lastMessage: '',
      lastMessageTime: DateTime.now().toString(),
    );
    await firebaseFirestore.collection('rooms').doc(userId).set(
          roomModel.toJson(),
        );
  }
}
