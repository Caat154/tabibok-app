import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  final List<Map<String, String>> reports = [
    {
      'title': 'فحص الدم الكامل',
      'date': '20 أبريل 2025',
      'summary': 'القيم كلها طبيعية، لا يوجد مؤشرات غير طبيعية.'
    },
    {
      'title': 'تحليل السكري',
      'date': '18 أبريل 2025',
      'summary': 'نسبة السكر مرتفعة قليلاً، ينصح بمتابعة غذائية.'
    },
    {
      'title': 'أشعة سينية على الصدر',
      'date': '10 أبريل 2025',
      'summary': 'الصورة تظهر سلامة الرئتين، لا توجد التهابات أو سوائل.'
    },
    {
      'title': 'تقرير القلب',
      'date': '1 أبريل 2025',
      'summary': 'النشاط القلبي سليم، لا توجد أي مشاكل كهربائية.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تقارير احمد محسن'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return Card(
            margin: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: ListTile(
              title: Text(report['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${report['date']}\n${report['summary']}'),
              isThreeLine: true,
              leading: Icon(Icons.description, color: Colors.blue),
            ),
          );
        },
      ),
    );
  }
}
