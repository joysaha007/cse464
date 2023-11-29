import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<bool> _taskCheckedState = [false, false, false]; // Keep track of checked state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _showAddTaskDialog(context);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ... (existing code)
 Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/my_image.jpeg"),
                ),
                SizedBox(height: 10),
                Text(
                  "Ashif Mujtoba",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "ashif@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "My Tasks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "3 Tasks",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              color: Colors.white,
              child: ListView.builder(
                itemCount: _taskCheckedState.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Task ${index + 1}',
                      style: TextStyle(
                        decoration: _taskCheckedState[index]
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    trailing: Checkbox(
                      value: _taskCheckedState[index],
                      onChanged: (value) {
                        setState(() {
                          _taskCheckedState[index] = value ?? false;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ... (existing code)
void _showAddTaskDialog(BuildContext context) {
  String newTaskName = ''; // Variable to store the new task name

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                newTaskName = value; // Update the new task name as the user types
              },
              decoration: InputDecoration(
                labelText: 'Task Name',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add task logic here
                setState(() {
                  // Add a new task to the list
                  _taskCheckedState.add(false);
                });
                Navigator.pop(context);
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      );
    },
  );
}

}








