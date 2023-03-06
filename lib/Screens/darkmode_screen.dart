import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanag/Provider/darkmode_provider.dart';
class Dark_Screen extends StatefulWidget {
   Dark_Screen({Key? key}) : super(key: key);

  @override
  State<Dark_Screen> createState() => _Dark_ScreenState();
}

class _Dark_ScreenState extends State<Dark_Screen> {
  @override
  Widget build(BuildContext context) {
    final themechange=Provider.of<Dark_Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('DARK MODE SCREEN'),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
               title: Text('Dark mode'),
              value: ThemeMode.dark,
              groupValue: themechange.darkMode,
              onChanged:
                 themechange.setMod,
              ),
          RadioListTile<ThemeMode>(
            title: Text('light mode'),
            value: ThemeMode.light,
            groupValue: themechange.darkMode,
            onChanged:
            themechange.setMod,
          ),
          RadioListTile<ThemeMode>(
            title: Text('system mode'),
            value: ThemeMode.system,
            groupValue: themechange.darkMode,
            onChanged:
            themechange.setMod,
          ),
          Icon(Icons.heart_broken)

        ],
      ),
    );
  }
}
