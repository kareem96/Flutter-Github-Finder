


import 'package:flutter/material.dart';

class FailureMessage extends StatelessWidget {
  final String text;
  const FailureMessage(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Center(
        child: Text(text, style: const TextStyle(fontSize: 18, color: Colors.redAccent),),
      ),
    );
  }
}
