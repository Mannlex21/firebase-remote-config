import 'package:demo_firebase_config/main.dart';
import 'package:demo_firebase_config/models/theme.dart';
import 'package:demo_firebase_config/services/remote_config_service.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RemoteConfigService remoteConfig = RemoteConfigService();
    ThemeFirebase? themeFirebase = remoteConfig.getTheme();
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Oflutter.com'),
            accountEmail: const Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor:
                  HexColor(themeFirebase?.theme.colorSecondary.value ?? ''),
              child: ClipOval(
                child: Image.network(
                  'https://www.acmes.com.mx/wp-content/uploads/2021/05/LOGO-GNP-SEGUROS.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite,
                color: HexColor(themeFirebase?.theme.colorPrimary.value ?? '')),
            title: const Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.person,
                color: HexColor(themeFirebase?.theme.colorPrimary.value ?? '')),
            title: const Text('Friends'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share,
                color: HexColor(themeFirebase?.theme.colorPrimary.value ?? '')),
            title: const Text('Share'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications,
                color: HexColor(themeFirebase?.theme.colorPrimary.value ?? '')),
            title: Text('Request'),
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.settings,
                color: HexColor(themeFirebase?.theme.colorPrimary.value ?? '')),
            title: const Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description,
                color: HexColor(themeFirebase?.theme.colorPrimary.value ?? '')),
            title: const Text('Policies'),
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            title: const Text('Exit'),
            leading: Icon(Icons.exit_to_app,
                color: HexColor(themeFirebase?.theme.colorPrimary.value ?? '')),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
