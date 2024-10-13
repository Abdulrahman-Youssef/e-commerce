import 'package:flutter/material.dart';

class TextBody extends StatelessWidget {
  final String bodyText ;
  const TextBody({super.key, required this.bodyText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Text(
        bodyText,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.grey),
        textAlign: TextAlign.center,
      ),
    );
  }
}
