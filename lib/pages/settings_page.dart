import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final ValueChanged<ThemeMode> onThemeChanged;
  final ThemeMode currentTheme;

  const SettingsPage({
    required this.onThemeChanged,
    required this.currentTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الإعدادات')),
      body: Column(
        children: [
          ListTile(
            title: Text('الوضع الليلي'),
            trailing: Switch(
              value: currentTheme == ThemeMode.dark,
              onChanged: (value) {
                onThemeChanged(value ? ThemeMode.dark : ThemeMode.light);
              },
            ),
          ),
        ],
      ),
    );
  }
}
