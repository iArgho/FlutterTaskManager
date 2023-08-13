import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/cancelled.dart';
import 'package:task_manager/ui/screens/progress.dart';
import 'completed.dart';
import 'new_task.dart';

class BottomNavBaseScreen extends StatefulWidget {
  @override
  _BottomNavBaseScreenState createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  int _selectedScreenIndex = 0;

  final List<Widget> _screens = [
    NewTask(),
    Completed(),
    Cancelled(),
    Progress(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        currentIndex: _selectedScreenIndex,
        onTap: (index) {
          setState(() {
            _selectedScreenIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task_sharp), label: 'New Task'),
          BottomNavigationBarItem(icon: Icon(Icons.task_sharp), label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.task_sharp), label: 'Cancelled'),
          BottomNavigationBarItem(icon: Icon(Icons.task_sharp), label: 'Progress'),
        ],
      ),
    );
  }
}
