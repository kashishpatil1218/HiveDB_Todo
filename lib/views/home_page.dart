import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_with_hivedb/data/database.dart';
import 'package:todo_with_hivedb/utils/dialouge_box.dart';
import 'package:todo_with_hivedb/utils/todo_title.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the box  <-----------------------
  final _myBox = Hive.box('mybox');

  TodoDataBase db = TodoDataBase();

  // Text Controller
  final _controller = TextEditingController();
  //List of todo task
  // List todoList = [
  //   ['coding', false],
  //   ['do Exercise', false],
  // ];

  // tapped checkbox
  void chechBoxChanged(bool value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }
//Save new task

  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();

  }
  //crete new
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialougeBox(
          controller: _controller,
         onSave: saveNewTask,
          onCancle: () => Navigator.of(context).pop(),
        );
      },
    );
  }
//delete Task
  void deleteTask(int index)
  {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();

  }
  @override
  @override
  void initState() {

    // if this is 1st time ever opening the app, then create default data
    if(_myBox.get("TODOLIST") ==  null){
db.createInitialData();
    }
    else{
      // if already exist the data
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5d1049),
      appBar: AppBar  (
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Color(0xff4f053b),
        title: Text(
          'Hive Todo ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff200117),
        onPressed: createNewTask,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTitle(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => chechBoxChanged(value!, index),
            deleteFunction: (context) =>deleteTask(index),
          );
        },
      ),
    );
  }
}
