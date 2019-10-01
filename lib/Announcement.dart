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
      print("Announcements " + res.body);

      var ParsedJson = jsonDecode(res.body);
      announcements = (ParsedJson['announcementdata'] as List).
      map((data)=>GetAnnouncements.fromJson(data)).toList();
      print(announcements.length);

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
      body:
        Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: announcements.isEmpty ?
                Center(child: Text('No Announcements published yet')) :

          ListView.builder(
                    itemCount: announcements.length,
                    itemBuilder: (c, i) {
                      return GestureDetector(
                        onTap: () {},
                        child: dummytext(
                          color: GlobalData.pinkred,
                          heading: announcements[i].announcementtitle,
                          paragraph: announcements[i].subject,
                          id: announcements[i].id,
                          title: announcements[i].createddate.toString(),

                        ),
                      );
                    }),
              ),
            ],
          ),
        ),

    );
  }

  @override
  void initState() {
    GetAnnouncement();
    // TODO: implement initState
    super.initState();
  }

}
