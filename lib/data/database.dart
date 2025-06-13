import 'package:hive/hive.dart';

class TodoDataBase{
  List toDoList = [];

  //reference the box  <-----------------------
  final _myBox = Hive.box("mybox");

//run this method if this is the 1st time ever opening the app
  void createInitialData(){
    toDoList=[
      ['Code a new app',false],
      ['Do Exercide',false],
    ];

  }
  //load the data from the database
void loadData(){
toDoList = _myBox.get("TODOLIST");
}

// Update the database
void updateData(){
    _myBox.put("TODOLIST", toDoList);

}
}