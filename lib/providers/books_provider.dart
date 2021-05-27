import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/book.dart';

class Books with ChangeNotifier {
  Map<String, Book> _books = {};

  Books() {
    FirebaseFirestore.instance.collection("books").snapshots().listen((event) {
      print("${DateTime.now()}: $event");
      event.docChanges.forEach((change) {
        if (change.type == DocumentChangeType.removed) {
          _books.remove(change.doc.id);
        } else {
          _books[change.doc.id] = Book(
              title: change.doc.data()!["book_name"],
              author: change.doc.data()!["book_author"],
              genere: change.doc.data()!["book_type"].toString(),
              owner: change.doc.data()!["owner_id"]);
        }
      });
      notifyListeners();
    });
  }

  List<Book> get books {
    return [..._books.values];
  }
}
