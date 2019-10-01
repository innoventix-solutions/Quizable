import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'global.dart';
import 'package:newpro/Pojo/pojo_GetAnnouncement.dart';
import 'dart:convert';

class Announcement extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {

  List<GetAnnouncements> announcements = new List();


  GetAnnouncement() async{

    await http.post("http://edusupportapp.com/api/get_announcement.php",
        body: {

        }).then((res){
      print(res.body);

      var ParsedJson = jsonDecode(res.body);
      announcements = (ParsedJson['announcementdata'] as List).map((data)=>GetAnnouncement().fromJson(data)).toList();


      setState(() {

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,
        backgroundColor: Color(0Xff1F0BE6),


        title: Center(
          child: Text(
            "Announcement",
            style: TextStyle(fontSize: 22),
          ),
        ),
        flexibleSpace: Container(
          decoration: bg12,
        ),
        actions: <Widget>[
          IconButton(onPressed: (){},
            icon: Icon(
              Icons.account_circle,
              color: Colors.transparent,
              size: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[announcements.isEmpty?
            Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "No Announcements published yet.",
                    style: TextStyle(fontSize: 18, height: 1.2),
                    textAlign: TextAlign.center,
                  ),
                ))
                :
              Expanded(
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (c, i) {
                      return GestureDetector(
                        onTap: () {},
                        child: recentquestions(
                          color: GlobalData.pinkred,
                          heading: announcements[i].announcementtitle,
                          paragraph: announcements[i].subject,
                          id: announcements[i].id,

                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
