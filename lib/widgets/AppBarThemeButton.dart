import 'package:automobile_data/models/AppTheme.dart';
import 'package:automobile_data/viewmodels/ThemeChanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarThemeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger theme = Provider.of<ThemeChanger>(context);

    return IconButton(
        icon: Icon(theme.appTheme == AppTheme.light
            ? Icons.wb_sunny
            : Icons.brightness_2),
        onPressed: () {
          if (theme.appTheme == AppTheme.light) {
            theme.setAppTheme(AppTheme.dark);
          } else {
            theme.setAppTheme(AppTheme.light);
          }
        });
  }
}
