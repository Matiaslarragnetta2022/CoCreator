import 'package:cocreator_app/screens/profile/widgets/followers.dart';
import 'package:cocreator_app/screens/profile/widgets/social_profile.dart';
import 'package:cocreator_app/screens/profile/widgets/user_image_profile.dart';
import 'package:cocreator_app/shared/preferences.dart';
import 'package:cocreator_app/theme/app_theme.dart';
import 'package:cocreator_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;

  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller =
        TabController(length: 2, initialIndex: selectedPage, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: CustomPaint(
                    painter: _HeaderWaveGradientPainter(),
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 170, //size.height * 0.21,
                    left: size.width * 0.40,
                  ),
                  child: Column(
                    children: [
                      const UserImageProfile(),
                      Text(
                        Preferences.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(Preferences.direction,
                          style: const TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Followers(),
            const EditProfile(),
            const SizedBox(
              height: 20,
            ),
            const SocialProfile(),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                SizedBox(
                  width: 350,
                  // decoration: const BoxDecoration(
                  //     border: Border(
                  //         bottom:
                  //             BorderSide(width: 1, color: Colors.deepPurple))),
                  child: Material(
                    child: TabBar(
                      indicator: BoxDecoration(
                          color: const Color(0xffF1F1FE),
                          borderRadius: BorderRadius.circular(10)),
                      //indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: const Color(0xff143E6C),
                      controller: controller,
                      labelColor: const Color(0xff5151C6),
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              width: 110,
                              height: 40,
                              child: const Text(
                                '200 Shots',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )),
                        ),
                        Tab(
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              width: 150,
                              height: 40,
                              child: const Text(
                                '10 Collections',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: TabBarView(
                    controller: controller,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Image.asset('assets/shot1.png'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: const Offset(0.0, 55.0), radius: 160);

    const Gradient gradiente = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomRight,
        colors: <Color>[
          AppTheme.primary,
          Color.fromARGB(255, 70, 20, 108),
          Color(0xff6D05FA),
        ],
        stops: [
          0.3,
          0.8,
          1.1,
        ]);

    final lapiz = Paint()..shader = gradiente.createShader(rect);

    // Propiedades
    // lapiz.color = Color(0xff615AAB);
    // lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 1.50);

    path.quadraticBezierTo(
        size.width * 0.50, size.height * 2.5, size.width, size.height * 1.50);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
