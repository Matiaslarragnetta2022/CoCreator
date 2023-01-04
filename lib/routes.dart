import 'package:cocreator_app/screens/business/crear_empresas.dart';
import 'package:cocreator_app/screens/business/formulario_crear_empresas.dart';
import 'package:cocreator_app/screens/cashflow/cash_flow_screen.dart';
import 'package:cocreator_app/screens/cashflow/credits.dart';
import 'package:cocreator_app/screens/conections/connections_screen.dart';
import 'package:cocreator_app/screens/home/home_screen.dart';
import 'package:cocreator_app/screens/ia/ia_screen.dart';
import 'package:cocreator_app/screens/login/check_auth_screen.dart';
import 'package:cocreator_app/screens/login/initial_screen.dart';
import 'package:cocreator_app/screens/login/login_screen.dart';
import 'package:cocreator_app/screens/login/register_screen.dart';
import 'package:cocreator_app/screens/profile/profile_screen.dart';
import 'package:cocreator_app/screens/questions/question1.dart';
import 'package:cocreator_app/screens/questions/question2.dart';
import 'package:cocreator_app/social%20media/social_screen.dart';
import 'package:cocreator_app/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

import 'chat/chat_screen.dart';
import 'chat/widgets/add_commentary.dart';
import 'screens/questions/question3.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case InitialScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const InitialScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case Question1Screen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Question1Screen(),
      );
    case Question2Screen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Question2Screen(),
      );
    case Question3Screen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Question3Screen(),
      );
    case IaScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const IaScreen(),
      );
    case ConnectionsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ConnectionsScreen(),
      );
    case CashFlowScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CashFlowScreen(),
      );
    case CreditsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CreditsScreen(),
      );
    case ProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ProfileScreen(),
      );
    case CrearEmpresasScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CrearEmpresasScreen(),
      );
    case FormCrearEmpresas.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FormCrearEmpresas(),
      );
    case ChatScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ChatScreen(),
      );
    case AddCommentary.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddCommentary(),
      );
      case SocialScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SocialScreen(),
      );

    case RegisterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegisterScreen(),
      );

    case CheckAuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CheckAuthScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
