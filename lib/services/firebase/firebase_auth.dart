import 'package:chatbox/logic/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static User user = auth.currentUser!;

  static Future createUser() async {
    ChatUser chatUser = ChatUser(
      name: user.displayName ?? 'aaaaaaaaaaaaaaaa',
      email: user.email ?? '',
      id: user.uid,
      image: user.photoURL ?? '',
      about: 'Hello, I am using ChatBox',
      createdAt: DateTime.now().toString(),
      lastActive: DateTime.now().toString(),
      pushToken: '',
      isOnline: false,
    );

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }
}
