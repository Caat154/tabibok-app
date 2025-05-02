import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الملف الشخصي')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "الاسم : احمد محسن",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text("العمر: 28", style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text("المرض: ارتفاع ضغط الدم", style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text("العلاج الحالي: أملوديبين 5 ملغ يوميًا", style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text("توصيات الطبيب:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(
                  "- تقليل الملح في الطعام\n- متابعة ضغط الدم أسبوعيًا\n- ممارسة الرياضة بانتظام",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
