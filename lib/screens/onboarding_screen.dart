import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'sign_in_screen.dart'; // <--- 1. Tambahkan import ini di paling atas

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "All your favorites",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Order from the best local restaurants\nwith easy, on-demand delivery.",
                textAlign: TextAlign.center,
                style: TextStyle(color: bodyTextColor, height: 1.5),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // <--- 2. Tambahkan navigasi ke SignInScreen di sini
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                  );
                },
                child: const Text("GET STARTED"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}