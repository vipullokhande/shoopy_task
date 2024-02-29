import 'package:flutter/material.dart';
import 'package:shoopy_task/features/screens/chats_list_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  //This function Navigates to ChatsListScreen
  navigateToChatsListScreen(context) {
    Future.delayed(const Duration(seconds: 4)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ChatsListScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    navigateToChatsListScreen(context);
    return Container(
      color: const Color.fromRGBO(18, 27, 32, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 6,
          ),
          Image.asset(
            'assets/images/logo.png',
            height: 200,
            width: 200,
          ),
          const Spacer(
            flex: 2,
          ),
          Image.asset(
            'assets/images/meta.png',
            height: 200,
            width: 200,
          ),
        ],
      ),
    );
  }
}
