import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) validator;
  final bool isNumber;
  final bool isObscure;
  final void Function()? onTapIcon;
  final Color? iconColor;

  const AuthTextField({
    super.key,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    required this.mycontroller,
    required this.validator,
    required this.isNumber,
    this.isObscure = false,
    this.onTapIcon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      obscureText: isObscure,
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: validator,
      controller: mycontroller,
      decoration: InputDecoration(
          suffixIcon: TextButton(
            onPressed: onTapIcon,
            child: Icon(iconData , color: iconColor,),
          ),
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
