import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("You're address"),
      ),
      body: ListView(
              children: const [
                Center(
                  child: Text("No addresses"),
                )
              ],
      ),
    );
  }
}
