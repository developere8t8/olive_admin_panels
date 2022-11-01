import 'dart:html';

class UserData {
  String? about;
  String? country;
  String? dob;
  String? education;
  String? email;
  String? gender;
  String? idCardBack;
  String? idCardFront;
  String? idCardWithPerson;
  String? interestIn;
  var interests;
  var lat;
  var long;
  String? address;
  String? name;
  String? number;
  String? password;
  List? profileImgs;
  String? type;
  String? userName;
  String? id;

  UserData(
      {required this.about,
      required this.address,
      required this.country,
      required this.dob,
      required this.education,
      required this.email,
      required this.gender,
      required this.idCardBack,
      required this.idCardFront,
      required this.idCardWithPerson,
      required this.interestIn,
      required this.interests,
      required this.lat,
      required this.long,
      required this.name,
      required this.number,
      required this.password,
      required this.profileImgs,
      required this.type,
      required this.userName,
      required this.id});

  UserData.fromMap(Map<String, dynamic> map) {
    about = map['about'];
    country = map['country'];
    dob = map['date of birth'];
    education = map['education'];
    email = map['email'];
    gender = map['gender'];
    idCardBack = map['id card back'];
    idCardFront = map['id card front'];
    idCardWithPerson = map['id card with person'];
    interestIn = map['interest in'];
    interests = map['interests'];
    lat = map['lat'].toString();
    address = map['location'];
    long = map['long'].toString();
    name = map['name'];
    number = map['number'];
    password = map['password'];
    profileImgs = map['profile'];
    type = map['type'];
    userName = map['username'];
    id = map['id'];
  }
}
