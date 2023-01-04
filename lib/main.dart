import 'package:cocreator_app/router/app_routes.dart';
import 'package:cocreator_app/routes.dart';
import 'package:cocreator_app/screens/login/check_auth_screen.dart';
import 'package:cocreator_app/screens/login/service/auth_service.dart';
import 'package:cocreator_app/screens/login/service/notifications_service.dart';
import 'package:cocreator_app/shared/preferences.dart';
import 'package:cocreator_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeChanger(ThemeData.dark(), 1)),
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final currenTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
              child,
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
            ),
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: NotificationsService.messengerKey,
        title: 'The Co Creator',
        theme: currenTheme,
        onGenerateRoute: (settings) => generateRoute(settings),
        routes: AppRoutes.getAppRoutes(),
        home: const CheckAuthScreen());
  }
}
