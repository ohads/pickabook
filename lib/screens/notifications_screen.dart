import 'package:flutter/material.dart';
import 'package:pickabook/widgets/notification_list_item.dart';
import 'package:pickabook/widgets/search_reasult_item.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index) {
            return NotificationListItem(index.toString());
          }),
    );
  }
}
