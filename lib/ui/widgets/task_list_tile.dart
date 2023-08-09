import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Task'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('This is task description'),
          Text('Date'),
          Row(
            children: [
              Chip(
                label: Text(
                  'New',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.green,
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  // Add your onPressed function here
                },
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  // Add your onPressed function here
                },
                icon: Icon(Icons.delete_forever),
              ),
            ],
          )
        ],
      ),
    );
  }
}
