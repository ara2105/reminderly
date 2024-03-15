import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  final String userName;

  HomePage({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reminderly',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Welcome, $userName!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'What would you like to do today?',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: SingleChildScrollView(
                child: TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(2000, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  calendarFormat: CalendarFormat.month,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                  ),
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    selectedTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    todayTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
