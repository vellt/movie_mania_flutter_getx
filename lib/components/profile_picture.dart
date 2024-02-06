import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    required this.url,
    required this.onTap,
    this.filePath,
    this.size,
  });
  final Uint8List? filePath;
  final String url;
  final Function() onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundImage: (filePath == null)
                ? NetworkImage(url)
                : Image.memory(filePath!).image,
            radius: size ?? 100,
          ),
          Padding(
            padding: EdgeInsets.only(right: 5, bottom: 5),
            child: Container(
              height: 50,
              width: 50,
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(50)),
            ),
          )
        ],
      ),
    );
  }
}
