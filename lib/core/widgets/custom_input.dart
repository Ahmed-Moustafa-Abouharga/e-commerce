import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({super.key, required this.title});
   final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context).textTheme.headlineSmall);
  }
}
