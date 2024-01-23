import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    required this.url,
    required this.onTap,
  });

  final String url;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(url),
            radius: 100,
          ),
          Container(
            height: 50,
            width: 50,
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(50)),
          )
        ],
      ),
    );
  }
}
