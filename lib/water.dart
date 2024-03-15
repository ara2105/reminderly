import 'package:flutter/material.dart';

class WaterReminderPage extends StatefulWidget {
  @override
  _WaterReminderPageState createState() => _WaterReminderPageState();
}

class _WaterReminderPageState extends State<WaterReminderPage> {
  int glassesDrank = 0;
  int goal = 8; // Default daily water intake goal
  double waterLevel = 0.0;

  void incrementGlasses() {
    setState(() {
      glassesDrank++;
      waterLevel = (glassesDrank / goal).clamp(0.0, 1.0);
    });
  }

  void decrementGlasses() {
    if (glassesDrank > 0) {
      setState(() {
        glassesDrank--;
        waterLevel = (glassesDrank / goal).clamp(0.0, 1.0);
      });
    }
  }

  void setGoal(int? value) {
    if (value != null) {
      setState(() {
        goal = value;
        waterLevel = (glassesDrank / goal).clamp(0.0, 1.0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Reminder'),
      ),
      backgroundColor: Colors.blue[50], // Set the background color to powder blue
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'How many glasses of water did you have today?',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10.0),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 150.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Icon(
                    Icons.local_drink,
                    size: 40.0,
                    color: Colors.blue,
                  ),
                ),
                AnimatedContainer(
                  height: waterLevel * 150.0,
                  width: 100.0,
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  color: Colors.blue,
                  onPressed: decrementGlasses,
                ),
                SizedBox(width: 10.0),
                Text(
                  glassesDrank.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(width: 10.0),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.blue,
                  onPressed: incrementGlasses,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Daily Goal: $goal glasses',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Set Goal: '),
                DropdownButton<int>(
                  value: goal,
                  onChanged: setGoal,
                  items: [8,9,10,11, 12,13,14,15, 16,17,18,19, 20].map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('$value glasses'),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
