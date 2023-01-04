import 'package:cocreator_app/chat/widgets/add_commentary.dart';
import 'package:cocreator_app/providers/chat_provider.dart';
import 'package:cocreator_app/shared/preferences.dart';
import 'package:cocreator_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/profile/widgets/user_image_profile.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = '/chat-screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Conecctions'),
      ),
      body: (ChatProvider().comments.isNotEmpty)
          ? ListView(
              children: _crearItem(),
            )
          : const Center(
              child: Text('There are no comments'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.pushNamed(
            context,
            '/add-commentary',
          );
        }),
        child: const AddCommentary(),
      ),
    );
  }

  List<Widget> _crearItem() {
    List<Widget> temporal = [];
    for (Map<String, dynamic> commentary in ChatProvider().comments) {
      Widget item = Padding(
        padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          decoration: BoxDecoration(
              color: const Color(0xffF6F7F9),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 120,
                  ),
                  const SizedBox(
                      width: 45, height: 40, child: UserImageProfile()),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    Preferences.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  '${commentary['Commentary']}',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    '2 min ago',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Like'),
                  SizedBox(
                    width: 120,
                  ),
                  Text(
                    '02',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    FontAwesomeIcons.heartCirclePlus,
                    color: AppTheme.primary,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      );
      temporal.add(item);
    }
    return temporal;
  }
}
