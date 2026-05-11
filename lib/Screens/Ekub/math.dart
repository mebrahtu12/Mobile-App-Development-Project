import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> pickRandomWinner() async {
  final firestore = FirebaseFirestore.instance;

  // 🔹 Get only members who have NOT won
  final snapshot = await firestore
      .collection('members')
      .where('hasWon', isEqualTo: false)
      .get();

  final members = snapshot.docs;

  if (members.isEmpty) {
    // print("All members have already won!");
    return;
  }

  // 🎲 Pick random
  final random = Random();
  final winnerDoc = members[random.nextInt(members.length)];
  final data = winnerDoc.data();

  // 🔐 Use transaction to avoid duplicate picking
  await firestore.runTransaction((transaction) async {
    final freshDoc = await transaction.get(
      firestore.collection('members').doc(winnerDoc.id),
    );

    // 🚨 Double check (important!)
    if (freshDoc['hasWon'] == true) {
      throw Exception("Already picked, try again");
    }

    // 🏆 Save winner
    transaction.set(firestore.collection('winners').doc(winnerDoc.id), {
      'username': data['username'],
      'email': data['email'],
      //'phone': data['phone'],
      //'memberId': winnerDoc.id,
      'timestamp': FieldValue.serverTimestamp(),
    });

    // ❌ Mark member as already won
    transaction.update(firestore.collection('members').doc(winnerDoc.id), {
      'hasWon': true,
    });
  });

  //print("Winner selected: ${data['username']}");
}
