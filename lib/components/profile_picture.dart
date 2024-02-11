import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

enum PictureMode { Memory, Network }

class ProfilePicture extends StatelessWidget {
  ProfilePicture({
    super.key,
    required this.url,
    required this.onTap,
    required this.filePath,
    this.size,
    required this.pictureMode,
  });
  String url; // NETWORK
  Function() onTap;
  Uint8List filePath; // MEMORY
  double? size; // átméretezhető (opcionális)
  PictureMode pictureMode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundImage: (pictureMode == PictureMode.Network)
                ? NetworkImage(url)
                : Image.memory(filePath).image,
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
