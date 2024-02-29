import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTab extends StatelessWidget {
  Widget divider;
  final String title;
  Color color;
  CustomTab({
    super.key,
    required this.divider,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        color: const Color.fromRGBO(18, 27, 32, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            divider,
          ],
        ),
      ),
    );
  }
}
