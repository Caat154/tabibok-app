import 'package:flutter/material.dart';

class SymptomCheckerPage extends StatefulWidget {
  @override
  _SymptomCheckerPageState createState() => _SymptomCheckerPageState();
}

class _SymptomCheckerPageState extends State<SymptomCheckerPage> {
  final TextEditingController _symptomController = TextEditingController();
  String? _result;

  void _checkSymptoms() {
    String symptom = _symptomController.text.toLowerCase();
    if (symptom.contains('صداع')) {
      _result = 'قد يكون لديك صداع توتري أو صداع نصفي.';
    } else if (symptom.contains('حمى')) {
      _result = 'قد يكون لديك عدوى فيروسية أو بكتيرية.';
    } else if (symptom.contains('سعال')) {
      _result = 'قد تكون مصاباً بالزكام أو التهاب في الجهاز التنفسي.';
    } else {
      _result = 'ينصح بمراجعة الطبيب لمزيد من التشخيص.';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('فحص الأعراض'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'أدخل عرضك الصحي:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _symptomController,
              decoration: InputDecoration(
                hintText: 'مثلاً: صداع، حمى، سعال...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkSymptoms,
              child: Text('تحقق'),
            ),
            SizedBox(height: 20),
            if (_result != null)
              Text(
                _result!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
