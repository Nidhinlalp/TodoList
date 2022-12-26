import 'package:expensetraker/util/my_button.dart';
import 'package:flutter/material.dart';

class DilogBox extends StatelessWidget {
  final cotroller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DilogBox({
    super.key,
    required this.cotroller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 246, 246, 246),
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //input
            TextField(
              controller: cotroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  
                  hintText: 'add new task'),
            ),

            //sevaboutton//cancelbutton

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //savve button
                MyButton(
                  onPressed: onSave,
                  text: 'Save',
                ),

                const SizedBox(
                  width: 20,
                ),
                //cencel button
                MyButton(
                  onPressed: onCancel,
                  text: 'Cancel',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
