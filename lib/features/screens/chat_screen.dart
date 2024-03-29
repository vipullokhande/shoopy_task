import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shoopy_task/common/data/messages_data.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  String image;
  String name;
  ChatScreen({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final userId = 1;
  final senderId = 2;
  var messages = MessagesData().messages.reversed.toList();
  @override
  Widget build(BuildContext context) {
    messages.shuffle();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 27, 32, 1),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(31, 44, 52, 1),
        leadingWidth: 73,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              const SizedBox(
                width: 7,
              ),
              const Icon(
                Icons.arrow_back,
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(widget.image),
              ),
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const Text(
              'Online',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(143, 161, 174, 1),
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: 40,
            child: Icon(
              MdiIcons.video,
            ),
          ),
          SizedBox(
            width: 40,
            child: Icon(
              MdiIcons.phone,
            ),
          ),
          const SizedBox(
            width: 40,
            child: Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: Expanded(
        child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.vertical,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Container(
                alignment: messages[index].uid == 1
                    ? Alignment.topLeft
                    : Alignment.topRight,
                margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                child: Column(
                  crossAxisAlignment: messages[index].uid == 1
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.85,
                        minWidth: MediaQuery.of(context).size.width * 0.2,
                      ),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        decoration: BoxDecoration(
                          color: messages[index].uid == 1
                              ? const Color(0xff1f2c34)
                              : const Color(0xff008369),
                          borderRadius: messages[index].uid == 1
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                )
                              : const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: messages[index].message.length < 10
                                    ? 60
                                    : 45,
                                left: 10,
                              ),
                              child: Text(
                                messages[index].message,
                                maxLines: 20,
                                textAlign: messages[index].uid == 1
                                    ? TextAlign.start
                                    : TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "12:08 PM",
                                    maxLines: 1,
                                    textAlign: messages[index].uid == 1
                                        ? TextAlign.start
                                        : TextAlign.end,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: messages[index].uid == 1
                                          ? const Color(0xff8796a0)
                                          : const Color(0xff90beb6),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                  messages[index].uid != 1
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(left: 3),
                                          child: Icon(
                                            MdiIcons.checkAll,
                                            color: Colors.blue,
                                            size: 17,
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: 50,
          margin:
              const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(31, 44, 52, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              ClipOval(
                child: Image.asset(
                  'assets/images/smile.png',
                ),
              ),
              SizedBox(
                height: 50,
                width: size.width * 0.46,
                child: const TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Message',
                    hintStyle: TextStyle(
                      // ignore: use_full_hex_values_for_flutter_colors
                      color: Color(0xffb8596a0),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 40,
                child: Transform.rotate(
                  angle: 45,
                  child: const Icon(
                    Icons.link,
                    // ignore: use_full_hex_values_for_flutter_colors
                    color: Color(0xffb8596a0),
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    // ignore: use_full_hex_values_for_flutter_colors
                    color: const Color(0xffb8596a0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.currency_rupee_sharp,
                    color: Color.fromRGBO(18, 27, 32, 1),
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
                child: Icon(
                  Icons.camera_alt,
                  // ignore: use_full_hex_values_for_flutter_colors
                  color: Color(0xffb8596a0),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
