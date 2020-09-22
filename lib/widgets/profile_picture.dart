import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(99)),
          border: Border.all(color: Colors.white, width: 3),
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://res.cloudinary.com/tiyeni/image/upload/v1582195378/white-girl.jpg'))),
    );
  }
}