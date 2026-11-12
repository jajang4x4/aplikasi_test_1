import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'entry_point.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _locationController = TextEditingController(text: "San Francisco");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: titleColor),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => EntryPoint(city: "San Francisco"),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Find restaurants near you",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: titleColor),
            ),
            const SizedBox(height: 8),
            const Text(
              "Please enter your location or allow access to\nyour location to find restaurants near you.",
              style: TextStyle(color: bodyTextColor, height: 1.4),
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 44),
                side: BorderSide(color: Colors.grey.shade300),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                setState(() {
                  _locationController.text = "San Francisco";
                });
              },
              icon: const Icon(Icons.near_me, color: primaryColor, size: 18),
              label: const Text("Use current location", style: TextStyle(color: primaryColor)),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.location_on, color: bodyTextColor),
                hintText: "Enter a new address",
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EntryPoint(
                      city: _locationController.text.isEmpty ? "San Francisco" : _locationController.text,
                    ),
                  ),
                );
              },
              child: const Text("Continue", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}