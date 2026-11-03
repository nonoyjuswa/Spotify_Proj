import 'package:flutter/material.dart';
import 'constants.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Scaffold.of(context).openDrawer(),
      child: CircleAvatar(
        radius: kAvatarRadius,
        backgroundColor: Colors.green,
        child: Icon(Icons.person, color: Colors.white),
      ),
    );
  }
}