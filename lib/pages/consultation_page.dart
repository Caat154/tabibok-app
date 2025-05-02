import 'package:flutter/material.dart';

class ConsultationPage extends StatelessWidget {
  final List<Map<String, String>> consultations = [
    {
      'name': 'د.محمد معون',
      'specialty': 'طبيب عام',
      'message': 'أرسل استشارتك هنا...',
    },
    {
      'name': 'د.ليلى علاوي',
      'specialty': 'أخصائية تغذية',
      'message': 'أسألني عن الحمية والأكل الصحي...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('استشارات طبية'),
      ),
      body: ListView.builder(
        itemCount: consultations.length,
        itemBuilder: (context, index) {
          final consultation = consultations[index];
          return ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(consultation['name']!),
            subtitle: Text(consultation['specialty']!),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('استشارة إلى ${consultation['name']}'),
                  content: Text(consultation['message']!),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('إغلاق'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
