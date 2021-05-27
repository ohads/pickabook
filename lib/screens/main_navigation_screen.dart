import 'package:flutter/material.dart';
import 'package:pickabook/screens/chats_screen.dart';
import 'package:pickabook/screens/notifications_screen.dart';
import 'package:pickabook/screens/profile_screen.dart';

import 'scan_screen.dart';
import 'search_list_screen.dart';

class WidgetWithIconAndTitle {
  Widget? widget;
  Icon? icon;
  String? title;

  WidgetWithIconAndTitle({this.widget, this.icon, this.title});
}

class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  String scan = "";

  final List<WidgetWithIconAndTitle> _children = [
    WidgetWithIconAndTitle(
      widget: SearchListScreen(),
      icon: Icon(Icons.home),
      title: "Home",
    ),
    WidgetWithIconAndTitle(
      widget: NotificationsScreen(),
      icon: Icon(Icons.notifications),
      title: "Notifications",
    ),
    WidgetWithIconAndTitle(
      widget: ChatsScreen(),
      icon: Icon(Icons.chat),
      title: "Chat",
    ),
    WidgetWithIconAndTitle(
      widget: ProfileScreen(),
      icon: Icon(Icons.account_circle),
      title: "Profile",
    ),
    WidgetWithIconAndTitle(
      widget: ScanScreen(),
      icon: Icon(Icons.add),
      title: "Add",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
        ),
      ),
      body: _children[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // This is all you need!
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          for (var child in _children)
            BottomNavigationBarItem(icon: child.icon!, label: child.title),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: "Home",
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.notifications),
          //   label: "Notificatinos",
          // ),
          // BottomNavigationBarItem(
          //   // activeIcon: Icon(Icons.account_circle_outlined),
          //   icon: Icon(Icons.account_circle),
          //   label: "Profile",
          // ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
