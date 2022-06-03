import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postest6_1915016145_m_faheld_as_farros/detailPage.dart';
import 'package:postest6_1915016145_m_faheld_as_farros/main.dart';
import 'package:postest6_1915016145_m_faheld_as_farros/counterController.dart';

class messagePage extends StatelessWidget {
  messagePage({Key? key}) : super(key: key);
  final counterController mycounterController = Get.put(counterController());

  @override
  Widget build(BuildContext context) {
    var l = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF1A374D),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "STEAM FRIENDS",
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 20,
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
                width: 400,
                height: 150,
                margin: EdgeInsets.only(top: 20, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF406882),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/clonetrooper.png'),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) {
                                  return messageDetailPage();
                                }),
                              );
                            },
                            child: Text(
                              'CT-1915016145',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 52, 183, 231),
                              ),
                            ),
                          ),
                          margin: EdgeInsets.only(top: 30),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 10),
                          child: Text(
                            'Online',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFBFDf6E),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 10),
                          child: Text(
                            'Playing: Star Wars: Battlefront 2',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFBFDf6E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 430),
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
