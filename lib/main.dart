
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_with_hivedb/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  Initialize Hive with default path
  await Hive.initFlutter();

  //  Open your box
  await Hive.openBox('mybox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

