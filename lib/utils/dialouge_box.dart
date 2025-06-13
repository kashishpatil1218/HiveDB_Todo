import 'package:flutter/material.dart';
import 'package:todo_with_hivedb/utils/buttons.dart';

class DialougeBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancle;

  DialougeBox({
    super.key,
    required this.controller,
    required this.onCancle,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      backgroundColor: Color(0xff55023F),
      content: Container(
        height: 151,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Add Data', style: TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            TextField(
              cursorColor: Colors.white,
              controller: controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Buttonspage(text: "Save", onPressed: onSave),
                SizedBox(width: 10),
                Buttonspage(text: "Cancle", onPressed:onCancle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
