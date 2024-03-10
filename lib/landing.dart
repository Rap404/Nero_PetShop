import 'package:aplikasi/signUp.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset('assets/atas.png'),
            ),
          ),
          const SizedBox(
            height: 120,
          ),
          Image.asset(
            'assets/logo.png',
            width: 270,
          ),
          const SizedBox(
            height: 70,
          ),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(255, 181, 115, 1)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(color: Colors.black, width: 1)),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUp()),
              );
            },
            child: const Text(
              'Get Started',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset('assets/bawah.png'),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
