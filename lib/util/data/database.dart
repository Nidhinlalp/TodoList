import 'package:hive/hive.dart';

class ToDoDataBase
{
  List toDoList=[];
  //referense our box
  final _myBox=Hive.box('mybox');
   
   //run this method if this is the 1st time opening this app

  void createIntialData()
  {
   toDoList=
   [
    ['Make...',false],
    ['Do Exercise',false],
   ];
  }

  //load the data
  void loadData()
  {
   toDoList=_myBox.get('TODOLIST');

  }
  //update
  void updateDataBase()
  {
    _myBox.put('TODOLIST', toDoList);
  }

}