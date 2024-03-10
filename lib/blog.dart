import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Di Halaman ini akan berisi blog"),
      ),
    );
  }
}
