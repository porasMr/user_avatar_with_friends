import 'package:flutter/material.dart';
import 'package:user_avatar_with_friends/user_avatar_with_friends.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> friendImage = [
    "assets/images/user_img.png",
    "assets/images/user_img.png",
    "assets/images/user_img.png",
    "assets/images/user_img.png",
    "assets/images/user_img.png"
  ];
  String userImage = "assets/images/dummy.jpeg";
  String placeHolder = "assets/images/user_img.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: UserAvatarWithFriendsList(
          userImage: userImage,
          imagePath: friendImage,
          placeHolderImage: placeHolder,
          imageWidth: 100,
          imageHeight: 100,
          space: 20,
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
