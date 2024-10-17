import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) validator;
  final bool isNumber;

  const AuthTextField(
      {super.key,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.validator,
      required this.isNumber});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: validator,
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
