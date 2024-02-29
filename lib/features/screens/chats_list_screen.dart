import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shoopy_task/common/data/users_data.dart';
import 'package:shoopy_task/features/widgets/custom_tab.dart';
import 'package:shoopy_task/features/widgets/single_chat_widget.dart';
import 'chat_screen.dart';

class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({super.key});

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen>
    with SingleTickerProviderStateMixin {
  late PageController? pageController;
  int currentIndex = 1;
  final users = UsersData().users;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 27, 32, 1),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(18, 27, 32, 1),
        title: const Text(
          'WhatsApp',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        actions: const [
          SizedBox(
            width: 40,
            child: Icon(
              Icons.camera_alt_outlined,
            ),
          ),
          SizedBox(
            width: 40,
            child: Icon(
              Icons.search,
            ),
          ),
          SizedBox(
            width: 40,
            child: Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 45,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 45,
                  color: const Color.fromRGBO(18, 27, 32, 1),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 7,
                      ),
                      Icon(
                        MdiIcons.accountGroup,
                        color: currentIndex == 0
                            ? const Color.fromRGBO(12, 160, 129, 1)
                            : const Color.fromRGBO(143, 161, 174, 1),
                      ),
                      const Spacer(),
                      currentIndex == 0
                          ? Container(
                              height: 3,
                              width: double.maxFinite,
                              color: currentIndex == 0
                                  ? const Color.fromRGBO(12, 160, 129, 1)
                                  : const Color.fromRGBO(143, 161, 174, 1),
                            )
                          : const SizedBox(height: 3)
                    ],
                  ),
                ),
                CustomTab(
                  divider: currentIndex == 1
                      ? Container(
                          height: 3,
                          width: double.maxFinite,
                          color: currentIndex == 1
                              ? const Color.fromRGBO(12, 160, 129, 1)
                              : const Color.fromRGBO(143, 161, 174, 1),
                        )
                      : const SizedBox(height: 3),
                  title: 'Chats',
                  color: currentIndex == 1
                      ? const Color.fromRGBO(12, 160, 129, 1)
                      : const Color.fromRGBO(143, 161, 174, 1),
                ),
                CustomTab(
                  divider: currentIndex == 2
                      ? Container(
                          height: 3,
                          width: double.maxFinite,
                          color: currentIndex == 2
                              ? const Color.fromRGBO(12, 160, 129, 1)
                              : const Color.fromRGBO(143, 161, 174, 1),
                        )
                      : const SizedBox(height: 3),
                  title: 'Updates',
                  color: currentIndex == 2
                      ? const Color.fromRGBO(12, 160, 129, 1)
                      : const Color.fromRGBO(143, 161, 174, 1),
                ),
                CustomTab(
                  divider: currentIndex == 3
                      ? Container(
                          height: 3,
                          width: double.maxFinite,
                          color: currentIndex == 3
                              ? const Color.fromRGBO(12, 160, 129, 1)
                              : const Color.fromRGBO(143, 161, 174, 1),
                        )
                      : const SizedBox(height: 3),
                  title: 'Calls',
                  color: currentIndex == 3
                      ? const Color.fromRGBO(12, 160, 129, 1)
                      : const Color.fromRGBO(143, 161, 174, 1),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                Container(
                  color: Colors.orange,
                ),
                Container(
                  color: const Color.fromRGBO(18, 27, 32, 1),
                  child: ListView.builder(
                    itemCount: users.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => SingleChatWidget(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              name: users[index].name,
                              image: users[index].asset,
                            ),
                          ),
                        );
                      },
                      image: users[index].asset,
                      name: users[index].name,
                      lastMessage: users[index].lastMessage,
                      icon: users[index].status != 's'
                          ? MdiIcons.checkAll
                          : Icons.check,
                      iconColor: users[index].status == 'r'
                          ? Colors.blue
                          : Colors.white,
                      date: '12/10/23',
                    ),
                  ),
                ),
                Container(
                  color: Colors.yellow,
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromRGBO(0, 168, 132, 1),
        foregroundColor: Colors.black,
        child: Icon(MdiIcons.message),
      ),
    );
  }
}
