import 'package:flutter/material.dart';
import 'package:socialmediaclone/model/userdata.dart';

class Mainheader extends StatelessWidget {
  Mainheader({super.key, required this.userdata});
  final Userdata userdata;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(userdata.myUserAccount.img),
          radius: 40,
        ),
        Text(
          userdata.myUserAccount.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        Text(userdata.myUserAccount.email),
        const SizedBox(height: 20),
      ],
    );
  }
}