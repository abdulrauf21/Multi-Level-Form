import 'package:flutter/material.dart';
import 'package:multi_form/view/homepage.dart';
import 'package:provider/provider.dart';

import 'model/lessonprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LessonProvider(),
      child: MaterialApp(
        title: 'Multi Level Form',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
