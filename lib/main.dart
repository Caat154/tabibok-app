import 'package:flutter/material.dart';
import 'pages/history_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';
import 'pages/medication_reminder_page.dart';
import 'pages/reports_page.dart';
import 'pages/consultation_page.dart';
import 'pages/symptom_checker_page.dart';
import 'pages/emergency_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
    Container(), // الإعدادات
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'طبيبك في جيبك',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: _currentIndex == 3
            ? SettingsPage(
                onThemeChanged: _toggleTheme,
                currentTheme: _themeMode,
              )
            : _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'السجل',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'الملف الشخصي',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'الإعدادات',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {
      'label': 'تذكير بالأدوية',
      'icon': Icons.notifications,
      'page': MedicationReminderPage(),
    },
    {
      'label': 'فحص الأعراض',
      'icon': Icons.search,
      'page': SymptomCheckerPage(),
    },
    {
      'label': 'الملف الصحي',
      'icon': Icons.folder_open,
      'page': ProfilePage(),
    },
    {
      'label': 'استشارات',
      'icon': Icons.chat_bubble_outline,
      'page': ConsultationPage(),
    },
    {
      'label': 'تقارير صحية',
      'icon': Icons.bar_chart,
      'page': ReportsPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.shield, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'طبيبك في جيبك',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.menu),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmergencyPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text('طوارئ'),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
              children: features.map((feature) {
                return InkWell(
                  onTap: () {
                    if (feature['page'] != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => feature['page'],
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(feature['icon'], size: 40, color: Colors.blue),
                        SizedBox(height: 12),
                        Text(
                          feature['label'],
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}