import 'package:flutter/material.dart';

void main() {
  runApp(DesainHalamanPengaturan());
}

class DesainHalamanPengaturan extends StatelessWidget {
  const DesainHalamanPengaturan({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Example variables to control toggle switches
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _autoUpdateEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Section: Account Settings
          _buildSectionTitle('Account Settings'),
          _buildListTile(
            icon: Icons.person,
            title: 'Profile',
            onTap: () {
              // Add navigation to Profile screen or logic
              print('Profile tapped');
            },
          ),
          _buildListTile(
            icon: Icons.security,
            title: 'Privacy',
            onTap: () {
              // Add navigation to Privacy screen or logic
              print('Privacy tapped');
            },
          ),
          Divider(),

          // Section: General Settings
          _buildSectionTitle('General Settings'),
          _buildSwitchTile(
            title: 'Enable Notifications',
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          _buildSwitchTile(
            title: 'Dark Mode',
            value: _darkModeEnabled,
            onChanged: (bool value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
          ),
          _buildSwitchTile(
            title: 'Auto Updates',
            value: _autoUpdateEnabled,
            onChanged: (bool value) {
              setState(() {
                _autoUpdateEnabled = value;
              });
            },
          ),
          Divider(),

          // Section: Help & Support
          _buildSectionTitle('Help & Support'),
          _buildListTile(
            icon: Icons.help,
            title: 'FAQ',
            onTap: () {
              print('FAQ tapped');
            },
          ),
          _buildListTile(
            icon: Icons.contact_mail,
            title: 'Contact Us',
            onTap: () {
              print('Contact Us tapped');
            },
          ),
          Divider(),

          // Section: Logout Button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle logout action
                print('Logged out');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper method to create list tiles (with icons and tap actions)
  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  // Helper method to create switch tiles
  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
