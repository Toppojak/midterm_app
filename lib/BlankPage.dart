//provider

import 'package:flutter/material.dart';

class Blankpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blank Page'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Content for Blank Page feature goes here.'),
      ),
    );
  }
}
