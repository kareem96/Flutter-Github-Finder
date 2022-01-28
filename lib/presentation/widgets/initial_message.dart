


import 'package:flutter/material.dart';

class InitialMessage extends StatelessWidget {
  final String text;
  const InitialMessage(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Center(
        child: Text(text, style: const TextStyle(fontSize: 18, color: Colors.blueGrey),),
      ),
    );
  }
}
