import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor, // AppBar color
        title: Text(
          'Login Screen',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10),
              Text(
                "sign in with your email and password or with your social media",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    label: const Text("Email"),
                    floatingLabelBehavior: FloatingLabelBehavior.always),
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    label: const Text("Email"),
                    floatingLabelBehavior: FloatingLabelBehavior.always),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
