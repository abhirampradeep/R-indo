class BuildingModel {
  String? uid;
  String? buildingname;
  String? location;
  String? Fileurl;

  BuildingModel({this.uid, this.buildingname, this.location, this.Fileurl});

  //recieving data from server
  factory BuildingModel.fromMap(map) {
    return BuildingModel(
      uid: map['uid'],
      buildingname: map['buildingname'],
      location: map['location'],
      Fileurl: map['Fileurl'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'buildingname': buildingname,
      'location': location,
      'Fileurl': Fileurl,
    };
  }
}
