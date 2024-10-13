import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;

  const AuthTextField(
      {super.key,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
     required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: mycontroller,
      decoration: InputDecoration(
          suffixIcon: Icon(iconData),
          hintText: hinttext,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          label: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(labeltext)),
          floatingLabelBehavior: FloatingLabelBehavior.always),
      style: const TextStyle(fontSize: 15),
    );
  }
}
