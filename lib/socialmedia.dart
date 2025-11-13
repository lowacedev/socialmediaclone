import 'package:flutter/material.dart';
import 'package:socialmediaclone/model/userdata.dart';
import 'package:socialmediaclone/views/friendlist.dart';
import 'package:socialmediaclone/views/infoheader.dart';
import 'package:socialmediaclone/views/mainheader.dart';
import 'package:socialmediaclone/views/postlist.dart';

class Socialmedia extends StatefulWidget {
  const Socialmedia({super.key});

  @override
  State<Socialmedia> createState() => _SocialmediaState();
}

class _SocialmediaState extends State<Socialmedia> {
  Userdata userdata = Userdata();

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),
        ),
        title: const Text('Panal Task 6'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Mainheader(userdata: userdata),
          Infoheader(userdata: userdata),
          Friendlist(userdata: userdata),
          const SizedBox(height: 20),
          Padding(padding:
          const EdgeInsets.only(left: 8.0),
          child: Row(children:
          [ Text('Posts', style: followTxtStyle,)]),
          ),
          const SizedBox(height: 20),
          Postlist(userdata: userdata),
        ],
      ),
    );
  }
}