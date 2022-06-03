import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postest6_1915016145_m_faheld_as_farros/counterController.dart';
import 'package:postest6_1915016145_m_faheld_as_farros/mainPage.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => MyHomePageState();
}

enum Status { Online, Offline, Away }

enum Genre { Adventure, FPS, Horror, None }

class MyHomePageState extends State<FormPage> {
  final counterController mycounterController = Get.put(counterController());
  final ctrlDescription = TextEditingController();
  String Description = '';
  Status status = Status.Online;
  Genre genre = Genre.None;

  @override
  void dispose() {
    ctrlDescription.dispose();
    super.dispose();
  }

  String getStatus(Status value) {
    if (value == Status.Online) {
      return "Online";
    } else if (value == Status.Offline) {
      return "Offline";
    } else if (value == Status.Away) {
      return "Away";
    }
    return '';
  }

  String getGenre(Genre value) {
    if (value == Genre.Adventure) {
      return "Adventure";
    } else if (value == Genre.FPS) {
      return "FPS";
    } else if (value == Genre.Horror) {
      return "Horror";
    } else if (value == Genre.None) {
      return "None";
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold(
      backgroundColor: Color(0xFF406882),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "STEAM PROFILE\n Greek God",
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        flexibleSpace: Obx(
          () => Container(
            color: mycounterController.switchValue.value
                ? Color(0xFF292c35)
                : Color(0xFF1a374d),
          ),
        ),
        actions: [
          Icon(Icons.dark_mode),
          Obx(
            () => Switch(
              value: mycounterController.switchValue.value,
              onChanged: (newValue) {
                mycounterController.switchValue.value = newValue;
              },
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: 400,
                height: 200,
                margin: EdgeInsets.only(top: 20, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF1A374D),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/greek.png'),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            '\n\n\nStatus               :  ${getStatus(status)}\n\nInterest Genre :  ${getGenre(genre)}\n\nProfile Desc     :  $Description',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 52, 183, 231),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.all(30),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: ctrlDescription,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'About Me',
                    labelText: 'Profile Description',
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Status',
                style: TextStyle(
                  color: Color.fromARGB(255, 52, 183, 231),
                  fontSize: 20,
                ),
              ),
              ListTile(
                title: Text(
                  'Online',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                leading: Radio(
                  groupValue: status,
                  value: Status.Online,
                  onChanged: (Status? value) {
                    setState(() {
                      status = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Offline',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                leading: Radio(
                  groupValue: status,
                  value: Status.Offline,
                  onChanged: (Status? value) {
                    setState(() {
                      status = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Away',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                leading: Radio(
                  groupValue: status,
                  value: Status.Away,
                  onChanged: (Status? value) {
                    setState(() {
                      status = value!;
                    });
                  },
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Genre",
                style: TextStyle(
                  color: Color.fromARGB(255, 52, 183, 231),
                  fontSize: 20,
                ),
              ),
              ListTile(
                title: Text(
                  'Adventure',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                leading: Radio(
                  groupValue: genre,
                  value: Genre.Adventure,
                  onChanged: (Genre? value) {
                    setState(() {
                      genre = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'FPS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                leading: Radio(
                  groupValue: genre,
                  value: Genre.FPS,
                  onChanged: (Genre? value) {
                    setState(() {
                      genre = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Horror',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                leading: Radio(
                  groupValue: genre,
                  value: Genre.Horror,
                  onChanged: (Genre? value) {
                    setState(() {
                      genre = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'None',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                leading: Radio(
                  groupValue: genre,
                  value: Genre.None,
                  onChanged: (Genre? value) {
                    setState(() {
                      genre = value!;
                    });
                  },
                ),
              ),
              Container(
                width: 150,
                height: 30,
                margin: EdgeInsets.all(25),
                child: ElevatedButton(
                  onPressed: () {
                    users.add({
                      'profile description': ctrlDescription.text
                    });
                    ctrlDescription.text = "";
                    setState(() {
                      Description = ctrlDescription.text;
                      final notifSnackBar = SnackBar(
                        content: Text(
                          'Profile Changed Successfully!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        duration: Duration(seconds: 3),
                        padding: EdgeInsets.all(8),
                        backgroundColor: Color(0xFF1A374D),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(notifSnackBar);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF1A374D),
                  ),
                  child: Text(
                    'Show Result',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Text(
                'Copyright by 1915016145 Faheld\n',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
