import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SingleChatWidget extends StatelessWidget {
  String image;
  String name;
  String lastMessage;
  VoidCallback onTap;
  dynamic icon;
  Color iconColor;
  String date;
  SingleChatWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.lastMessage,
    required this.onTap,
    required this.icon,
    required this.iconColor,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.all(15.0).copyWith(right: 10, bottom: 5),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(image),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.7,
                      child: SizedBox(
                        width: size.width * 0.5,
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.7,
                      child: Row(
                        children: [
                          Icon(
                            icon,
                            size: 18,
                            color: iconColor,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          SizedBox(
                            width: size.width * 0.6,
                            child: Text(
                              lastMessage,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color.fromRGBO(143, 161, 174, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 10,
            child: Text(
              date,
              maxLines: 1,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color.fromRGBO(143, 161, 174, 1),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
