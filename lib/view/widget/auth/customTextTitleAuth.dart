


import 'package:flutter/material.dart';

class CustomTextTitle extends StatelessWidget {
  final String text;
  const CustomTextTitle({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 17),
      textAlign: TextAlign.center,
    );
  }
}