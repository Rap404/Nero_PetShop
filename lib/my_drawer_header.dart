import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(198, 124, 78, 1),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/profil.png'))),
          ),
          Text(
            'Username',
            style: TextStyle(
                fontFamily: 'Poppins', fontSize: 20, color: Colors.white),
          ),
          Text(
            'userEmail@gmail.com',
            style: TextStyle(
                fontFamily: 'Poppins', fontSize: 14, color: Colors.grey[700]),
          )
        ],
      ),
    );
  }
}
