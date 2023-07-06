import 'package:egyuide/modules/otherpages/DropDown.dart';
import 'package:egyuide/modules/otherpages/SetNewPassword.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'EditProfile.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Container(
                color: Color(0xFFF2F2F7),
                child: Center(
                  child: Text(
                    "Settings",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0E7886)),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: SettingsList(
                  lightTheme: SettingsThemeData(
                    settingsListBackground: Color(0xFFF2F2F7),
                    settingsSectionBackground: Colors.white,
                    dividerColor: Colors.grey,
                    tileHighlightColor: Colors.grey,
                  ),
                  sections: [
                    SettingsSection(
                      title: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Color(0xFF0E7886),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Account',
                            style: TextStyle(
                              color: Color(0xFF0E7886),
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      tiles: <SettingsTile>[
                        SettingsTile.navigation(
                          leading: Icon(
                            Icons.person,
                            color: Color(0xFF0E7886),
                          ),
                          title: Text('Edit profile'),
                          onPressed: (BuildContext context) => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditProfile(),
                              ),
                            ),
                          },
                        ),
                        SettingsTile.navigation(
                          leading: Icon(
                            Icons.email,
                            color: Color(0xFF0E7886),
                          ),
                          title: Text('Email'),
                        ),
                        SettingsTile.navigation(
                          leading: Icon(
                            Icons.lock,
                            color: Color(0xFF0E7886),
                          ),
                          title: Text('Password'),
                          onPressed: (BuildContext context) => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SetNewPassword(),
                              ),
                            ),
                          },
                          //trailing: ,
                        ),
                        SettingsTile.navigation(
                          leading: Icon(
                            Icons.exit_to_app_outlined,
                            color: Color(0xFF0E7886),
                          ),
                          title: Text('Sign out'),
                          //trailing: ,
                        ),
                        SettingsTile.navigation(
                          leading: Icon(
                            Icons.lock,
                            color: Color(0xFF0E7886),
                          ),
                          title: Text('Privacy and Security'),
                          //trailing: ,
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: Color(0xFF0E7886),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'General',
                            style: TextStyle(
                              color: Color(0xFF0E7886),
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      tiles: <SettingsTile>[
                        SettingsTile.switchTile(
                          onToggle: (value) {},
                          initialValue: true,
                          activeSwitchColor: Color(0xFF0E7886),
                          leading: Icon(
                            Icons.format_paint,
                            color: Color(0xFF0E7886),
                          ),
                          title: Text('Enable custom theme'),
                        ),
                        SettingsTile.switchTile(
                          onToggle: (value) {},
                          activeSwitchColor: Color(0xFF0E7886),
                          initialValue: true,
                          leading: Icon(Icons.notifications,
                              color: Color(0xFF0E7886)),
                          title: Text('Allow notfications'),
                        ),
                        SettingsTile.navigation(
                          title: Container(height: 70, child: DropD()),
                          //trailing: ,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
