import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import '../model/lessonprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  bool showLessons = false;

  List<String> classes = <String>[
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
    'Class 11',
    'Class 12',
  ];

  List<String> sections = <String>[
    'Section A',
    'Section B',
    'Section C',
    'Section D',
  ];
  List<String> subjects = <String>[
    'English',
    'Maths',
    'Science',
    'Nepali',
    'Health',
    'Account',
    'Computer',
  ];
  String defaultClass = 'Class 8';
  String defaultSection = 'Section A';
  String defaultSubject = 'English';

  Map<String, dynamic> jsonFile = {};
  Future<void> readJson() async {
    isLoading = true;
    setState(() {});
    final String response = await rootBundle.loadString('assets/JsonData.json');
    final data = await json.decode(response);

    jsonFile = data;
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int counter = Provider.of<LessonProvider>(context).counter;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 57, 65),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white70,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add Lesson",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Color.fromARGB(255, 230, 244, 230),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 183, 231, 183),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Text("Class Details"),
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: DropdownButton<String>(
                                  alignment: AlignmentDirectional.centerStart,
                                  borderRadius: BorderRadius.circular(10),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,
                                  ),
                                  underline: Container(
                                    height: 0,
                                    color: Colors.grey,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      defaultClass = newValue!;
                                    });
                                  },
                                  value: defaultClass,
                                  items: classes.map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: DropdownButton<String>(
                                  alignment: AlignmentDirectional.centerStart,
                                  borderRadius: BorderRadius.circular(10),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,
                                  ),
                                  underline: Container(
                                    height: 0,
                                    color: Colors.grey,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      defaultSection = newValue!;
                                    });
                                  },
                                  value: defaultSection,
                                  items: sections.map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 183, 231, 183),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Text("Subject Details"),
                          ),
                        ],
                      ),
                    ),
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: DropdownButton<String>(
                        alignment: AlignmentDirectional.centerStart,
                        borderRadius: BorderRadius.circular(10),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                        ),
                        underline: Container(
                          height: 0,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            defaultSubject = newValue!;
                          });
                        },
                        value: defaultSubject,
                        items: subjects.map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 183, 231, 183),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Text("No. of Lessons"),
                    ),
//-------------------------------------------------------------------------------------------------------------------------------
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              Provider.of<LessonProvider>(context)
                                  .counter
                                  .toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Provider.of<LessonProvider>(context,
                                          listen: false)
                                      .decrement();
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, right: 20, left: 20),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    "-",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  Provider.of<LessonProvider>(context,
                                          listen: false)
                                      .increment();
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, right: 20, left: 20),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    "+",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
//-------------------------------------------------------------------------------------------------------------------------------
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 183, 231, 183),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Text("Lesson Details"),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("2/2" + "  Lessions"),
                          InkWell(
                            onTap: () {
                              setState(() {
                                showLessons = !showLessons;
                              });
                            },
                            child: Chip(
                                label: Row(
                              children: [
                                Text(showLessons
                                    ? "Hide lessons"
                                    : "Show lessons"),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            )),
                          )
                        ],
                      ),
                    ),
                    for (var lesson in jsonFile['DetailsColl'])
                      !showLessons
                          ? SizedBox(height: 5)
                          : ExpansionTile(
                              collapsedBackgroundColor:
                                  Color.fromARGB(255, 223, 242, 255),
                              leading: Text(lesson["SNo"].toString()),
                              title: Text(lesson["LessonName"]),
                              children: [
                                for (var topic in lesson['TopicColl'])
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(lesson["SNo"].toString() +
                                              '.' +
                                              topic["SNo"].toString()),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(topic["TopicName"]),
                                        ],
                                      ),
                                      Icon(
                                        Icons.delete_outline,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                  ],
                ),
              ),
            ),
    );
  }
}
