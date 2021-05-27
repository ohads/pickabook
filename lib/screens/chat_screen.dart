import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = "/chat_screen";

  @override
  Widget build(BuildContext context) {
    final chatId = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(),
      body: NewWidget(
        chat: chatId,
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  final String? chat;

  const NewWidget({
    Key? key,
    this.chat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc("2MWqhL2oAyMXKzAJwGte9K1a5by1")
          .collection("Conversations")
          .doc(chat)
          .collection("Messages")
          .orderBy("date_time", descending: true)
          .snapshots(),
      builder: (ctx, messagesSnapshot) {
        if (messagesSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Text(chat!),
            for (var doc in messagesSnapshot.data!.docs)
              Row(
                children: [
                  if (doc["uid"] == "2MWqhL2oAyMXKzAJwGte9K1a5by1")
                    Expanded(child: Text("")),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(doc["content"]),
                            Text(doc["date_time"]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
