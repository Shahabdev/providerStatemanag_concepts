import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanag/Provider/Favourite_provider.dart';
import 'package:provider_statemanag/Provider/count_provider.dart';
import 'package:provider_statemanag/Provider/darkmode_provider.dart';
import 'package:provider_statemanag/Provider/login_provider.dart';
import 'package:provider_statemanag/Screens/count_example.dart';
import 'package:provider_statemanag/Provider/provider_Exampleone.dart';
import 'package:provider_statemanag/Screens/darkmode_screen.dart';
import 'package:provider_statemanag/Screens/favourite_screen.dart';
import 'package:provider_statemanag/Screens/login_screen.dart';
import 'package:provider_statemanag/Screens/value_noti_listner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const My_Home();
  }
}

class My_Home extends StatefulWidget {
  const My_Home({Key? key}) : super(key: key);

  @override
  State<My_Home> createState() => _My_HomeState();
}

class _My_HomeState extends State<My_Home> {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Counter_Provider(),
        ),
        ChangeNotifierProvider(create: (_) => Example_oneProvider()),
        ChangeNotifierProvider(create: (_) => FavouiteitemProvider()),
        ChangeNotifierProvider(create: (_) => Dark_Provider()),
        ChangeNotifierProvider(create:(_)=> Login_provider()),

      ],
      child: Builder(builder: (BuildContext context)
    {
      final themechange=Provider.of<Dark_Provider>(context);
      return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
            primarySwatch: Colors.yellow
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          //primaryColor: Colors.red,
          iconTheme: IconThemeData(
            color: Colors.red
          )

          //iconTheme:
        ),
        themeMode: themechange.darkMode,

        home: Dark_Screen(),
      );

    })

    );
  }
}

