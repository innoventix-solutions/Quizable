class GetAnnouncements{
  String id;
  String announcementtitle;
  String subject;
  String createddate;


  GetAnnouncements({
    this.id,this.announcementtitle,this.subject,this.createddate
});




  

  factory GetAnnouncements.fromJson(Map<String, dynamic> parsedJson){
    return GetAnnouncements(
      id: parsedJson['ID'].toString(),
      announcementtitle: parsedJson['title'].toString(),
      subject: parsedJson['subject'].toString(),
      createddate: parsedJson['created_date'].toString(),


    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id':id,


      };
}
