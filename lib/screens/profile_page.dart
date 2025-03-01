import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/girl.jpg'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Take Care!", style: TextStyle(color: Colors.grey)),
                    Text(
                      "Richa Bose",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Settings',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            buildSettingsItem(Icons.notifications, "Notification",
                "Check your medicine notification"),
            buildSettingsItem(
                Icons.volume_up, "Sound", "Ring, Silent, Vibrate"),
            buildSettingsItem(Icons.person, "Manage Your Account",
                "Password, Email ID, Phone Number"),
            buildSettingsItem(Icons.notifications, "Notification",
                "Check your medicine notification"),
            buildSettingsItem(Icons.notifications, "Notification",
                "Check your medicine notification"),
            const SizedBox(height: 20),
            const Text("Device",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  buildSettingsItem(
                      Icons.bluetooth, "Connect", "Bluetooth, Wi-Fi"),
                  buildSettingsItem(
                      Icons.volume_up, "Sound Option", "Ring, Silent, Vibrate"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Caretakers: 03",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCaretakerAvatar("Dipa Luna", "assets/girl1.jpg"),
                  buildCaretakerAvatar("Roz Sod..", "assets/girl2.jpg"),
                  buildCaretakerAvatar("Sunny Tu..", "assets/girl1.jpg"),
                  buildAddButton(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Doctor",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.32,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add_circle, size: 40, color: Colors.blue),
                  SizedBox(height: 10),
                  Text("Add Your Doctor",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Or use invite link",
                      style: TextStyle(color: Colors.orange)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            buildSettingsItem(Icons.privacy_tip, "Privacy Policy", ""),
            buildSettingsItem(Icons.article, "Terms of Use", ""),
            buildSettingsItem(Icons.star, "Rate Us", ""),
            buildSettingsItem(Icons.share, "Share", ""),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const SignInScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.blue, width: 2),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  elevation: 0,
                ),
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      onTap: () {},
    );
  }

  Widget buildCaretakerAvatar(String name, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(fontSize: 12, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget buildAddButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(Icons.add, color: Colors.black54),
          ),
          const SizedBox(height: 5),
          const Text("Add", style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
