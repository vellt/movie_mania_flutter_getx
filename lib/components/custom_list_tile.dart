import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.prefixIcon,
    required this.mainTitle,
    required this.subTitle,
    this.iconButton,
  });

  final IconData prefixIcon;
  final String mainTitle;
  final String subTitle;
  final Widget? iconButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: Icon(
            prefixIcon,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 54, 54, 54),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainTitle,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
              height: 3,
            ),
            Text(subTitle, style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
        trailing: iconButton,
      ),
    );
  }
}
