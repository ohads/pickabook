import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './chat_screen.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FirebaseAuth.instance.currentUser == null
          ? Text("you must be logged in")
          : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection("Conversations")
                  .snapshots(),
              builder: (ctx, conversationsSnapshot) {
                if (conversationsSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (conversationsSnapshot.data!.docs.length == 0) {
                  return Text("no chats found");
                }
                return ListView.builder(
                  itemCount: conversationsSnapshot.data!.docs.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(ctx).pushNamed(ChatScreen.routeName,
                            arguments:
                                conversationsSnapshot.data!.docs[index].id);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder<DocumentSnapshot>(
                            future: FirebaseFirestore.instance
                                .collection("users")
                                .doc(conversationsSnapshot.data!.docs[index].id)
                                .get(),
                            builder: (ctx, userSnapshot) {
                              if (userSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return Text(userSnapshot.data!["full_name"]);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
