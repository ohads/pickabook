import 'package:flutter/material.dart';

class NotificationListItem extends StatelessWidget {
  String string;

  NotificationListItem(this.string);

  @override
  Widget build(BuildContext context) {
    return Text(string);
  }
}
