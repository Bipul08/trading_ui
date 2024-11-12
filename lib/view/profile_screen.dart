import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assigment_bdm/authentication_screen/login/login_page.dart';

class ProfileScreen extends StatelessWidget {
  Future<void> _logout(BuildContext context) async {
    // Clear login status in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Login_Screen()),
          (route) => false,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop();
                _logout(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B1A43),
      appBar: AppBar(
        backgroundColor: Color(0xFF0B1A43),
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child: Text(
              'JD',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'John Doe',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(height: 8),
          Text(
            '+852 XXXX5643',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            'Age 26 | Joined on Oct-2024',
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
          SizedBox(height: 24),

          // Scrollable card section
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionTitle(title: 'Payment & Settings'),
                    SettingsItem(title: 'Profile Settings', onTap: () {}),
                    SettingsItem(title: 'Payment Settings', onTap: () {}),
                    SettingsItem(title: 'Nominee Settings', onTap: () {}),
                    SettingsItem(title: 'KYC Verification', onTap: () {}),
                    Divider(color: Colors.grey.shade400),

                    SectionTitle(title: 'Help Desk'),
                    SettingsItem(title: "FAQ's", onTap: () {}),
                    SettingsItem(title: 'Reach out to us', onTap: () {}),
                    Divider(color: Colors.grey.shade400),

                    SectionTitle(title: 'App Settings'),
                    SettingsItem(title: 'App Settings', onTap: () {}),
                    SettingsItem(title: 'Privacy Policy', onTap: () {}),
                    SettingsItem(
                      title: 'Logout',
                      onTap: () => _showLogoutDialog(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0B1A43),
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SettingsItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.black87, fontSize: 16),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black87, size: 18),
      onTap: onTap,
    );
  }
}


