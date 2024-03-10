import 'package:aplikasi/privacy_policy.dart';
import 'package:aplikasi/settings.dart';
import 'package:flutter/material.dart';

import 'contacts.dart';
import 'home.dart';
import 'blog.dart';
import 'my_drawer_header.dart';
import 'myCart.dart';
import 'notifications.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: drawer(),
    );
  }
}

class drawer extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<drawer> {
  var currentPage = DrawerSections.home;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.home) {
      container = const homePage();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactsPage();
    } else if (currentPage == DrawerSections.events) {
      container = BlogPage();
    } else if (currentPage == DrawerSections.my_cart) {
      container = cartPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(198, 124, 78, 1),
        title: const Text(
          "Nero PetShop",
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.home,
              currentPage == DrawerSections.home ? true : false),
          menuItem(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Blog", Icons.newspaper,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "My Cart", Icons.shopping_cart,
              currentPage == DrawerSections.my_cart ? true : false),
          const Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          const Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.home;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.my_cart;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  home,
  contacts,
  events,
  my_cart,
  settings,
  notifications,
  privacy_policy,
}
