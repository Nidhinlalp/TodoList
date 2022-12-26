import 'package:expensetraker/util/data/database.dart';
import 'package:expensetraker/util/dialog_box.dart';
import 'package:expensetraker/util/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  // referense the box
  final _myBox=Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
  // 1st tjime open defult data
   
   if(_myBox.get('TODOLIST')==null)
   {
    db.createIntialData();
   }else{
    // alredy exist data
    db.loadData();
   }
    
    super.initState();
    
  }


  //list of to do task
 

  //chek box was updated
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }
  //sva new task
 void  saveNewTask()
 {
  setState(() {
    db.toDoList.add([_cotroller.text,false]);
    _cotroller.clear();
  });
  Navigator.of(context).pop();
  db.updateDataBase();
 }

  //text cotroller

  final _cotroller=TextEditingController();

  //createa new task

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DilogBox(
          cotroller:_cotroller ,
          onSave: saveNewTask,
          onCancel: ()=>Navigator.of(context).pop(),
        );
      },
    );
  }
  //delete task
 void deleteTask(int index)
 {
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.updateDataBase();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Center(
          child: Text(
            'TO DO',
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body:ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(index: index,
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunnction:  (context) => deleteTask(index),
            );
          },
        ),
      );
    
  }
}
