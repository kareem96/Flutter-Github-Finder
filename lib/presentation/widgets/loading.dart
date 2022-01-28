


import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
      ),
    );
  }
}
