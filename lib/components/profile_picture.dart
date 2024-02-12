import 'dart:typed_data';

import 'package:flutter/material.dart';

enum PictureMode { Memory, Network }

class ProfilePicture extends StatelessWidget {
  ProfilePicture({
    super.key,
    required this.url,
    required this.onTap,
    required this.imageMemoryData,
    this.size, // opcionális
    required this.pictureMode,
  });

  String url; // NETWORK
  Function() onTap; // képre való kattintási esemény
  Uint8List imageMemoryData; // MEMORY
  double? size; // null értékű mert opcionális
  PictureMode pictureMode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundImage: (pictureMode == PictureMode.Network) ? NetworkImage(url) : Image.memory(imageMemoryData).image,
            radius: size ?? 100,
          ),
          Container(
            height: 50,
            width: 50,
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(50)),
          )
        ],
      ),
    );
  }
}
