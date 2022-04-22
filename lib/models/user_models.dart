import 'package:intl/intl.dart';

class User {
  final int id;
  final String name;
  final String msg;
  final String time;
  final String img;
  final String phone;
  bool isAsset = true;

  User({
    required this.id,
    required this.name,
    required this.msg,
    required this.time,
    required this.img,
    required this.phone,
    required this.isAsset,
  });
}

List<User> user = <User>[
  User(
      id: 1,
      name: 'Tony Lokhand Wala',
      msg: 'Flutter is great',
      time: '12:28 PM',
      img: 'assets/images/tony.jpg',
      phone: '+91 25314 23526',
      isAsset: true),
  User(
      id: 2,
      name: 'Senapati',
      msg: 'Mai gareeb hu',
      time: '1:25 AM',
      img: 'assets/images/cap.jpg',
      phone: '+91 25314 23526',
      isAsset: true),
  User(
      id: 3,
      name: 'Thor Hathoda Walo',
      msg: 'Done',
      time: '4:23 PM',
      img: 'assets/images/thor.jpg',
      phone: '+91 25314 23526',
      isAsset: true),
  User(
      id: 4,
      name: 'Thanos Chapti Walo',
      msg: 'Ready for fight?',
      time: '12:28 PM',
      img: 'assets/images/thanos.jpg',
      phone: '+91 25314 23526',
      isAsset: true),
  User(
      id: 5,
      name: 'Hulk Gabharu Javan',
      msg: 'i throw my phone...',
      time: '12:28 PM',
      img: 'assets/images/hulk.jpg',
      phone: '+91 25314 23526',
      isAsset: true),
  User(
      id: 6,
      name: 'Dr Strange Magic Dada',
      msg: "It's magic.",
      time: 'Today',
      img: 'assets/images/dr_s.jpg',
      phone: '+91 25314 23526',
      isAsset: true),
  User(
      id: 7,
      name: 'Vir Jaala Walo',
      msg: 'Tum mere dost ho',
      time: 'Today',
      img: 'assets/images/spidy.jpg',
      phone: '+91 25314 23526',
      isAsset: true),
  User(
      id: 8,
      name: 'Kidi Man',
      msg: 'Tirandaz juth col raha hai.',
      time: 'Yesterday',
      img: 'assets/images/ant.jpg',
      phone: '+91 25314 23526',
      isAsset: true),
  User(
      id: 9,
      name: 'Tirandaz',
      msg: 'Bhai mere arrow kidi..',
      time: 'Yesterday',
      img: 'assets/images/tir.jpg',
      phone: '+91 25314 23526',
      isAsset: true),
  User(
      id: 10,
      name: 'Black Window',
      msg: 'Ok',
      time: 'Yesterday',
      img: 'assets/images/bw.jpg',
      phone: '+91 25314 23526',
      isAsset: true),
];

String? name;
String? description;

DateTime now = DateTime.now();

var formatter = DateFormat('dd-MM-yyyy');
String formattedTime = (DateTime.now().hour > 12)
    ? "${DateTime.now().hour - 12}:${DateTime.now().minute} ${DateFormat('a').format(now)}"
    : "${DateTime.now().hour}:${DateTime.now().minute} ${DateFormat('a').format(now)}";

bool light = true;
bool cupLight = true;
