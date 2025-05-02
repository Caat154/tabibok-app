import 'package:flutter/material.dart';

class MedicationReminderPage extends StatefulWidget {
  @override
  _MedicationReminderPageState createState() => _MedicationReminderPageState();
}

class _MedicationReminderPageState extends State<MedicationReminderPage> {
  final List<Map<String, dynamic>> medications = [
    {
      'name': 'باراسيتامول',
      'time': TimeOfDay(hour: 8, minute: 0),
    },
    {
      'name': 'أموكسيسيلين',
      'time': TimeOfDay(hour: 14, minute: 0),
    },
    {
      'name': 'فيتامين D',
      'time': TimeOfDay(hour: 20, minute: 30),
    },
  ];

  void _pickTime(int index) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: medications[index]['time'],
    );

    if (picked != null) {
      setState(() {
        medications[index]['time'] = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تذكير بالأدوية'),
      ),
      body: ListView.builder(
        itemCount: medications.length,
        itemBuilder: (context, index) {
          final med = medications[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(Icons.medication, color: Colors.blue),
              title: Text(med['name'], style: TextStyle(fontSize: 18)),
              subtitle: Text('الوقت: ${med['time'].format(context)}'),
              trailing: IconButton(
                icon: Icon(Icons.edit, color: Colors.grey),
                onPressed: () => _pickTime(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
