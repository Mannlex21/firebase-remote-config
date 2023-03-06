import 'package:demo_firebase_config/models/theme.dart';
import 'package:demo_firebase_config/navbar.dart';
import 'package:demo_firebase_config/services/remote_config_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await RemoteConfigService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Hide the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Kindacode.com',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Business',
      style: optionStyle,
    ),
    Text(
      'School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RemoteConfigService remoteConfig = RemoteConfigService();
    ThemeFirebase? themeFirebase = remoteConfig.getTheme();
    return Scaffold(
      drawer: NavBar(),
      backgroundColor: HexColor(themeFirebase?.theme.background.value ?? ''),
      appBar: AppBar(
        backgroundColor:
            HexColor(themeFirebase?.theme.colorPrimary.value ?? ''),
        title: Text(
          'GNP',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color:
                  HexColor(themeFirebase?.theme.colorTextPrimary.value ?? '')),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.remove_red_eye),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('This is a snackbar'),
                  backgroundColor: HexColor(
                      themeFirebase?.theme.colorTextPrimary.value ?? '')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: HexColor(
                          themeFirebase?.theme.colorPrimary.value ?? ''),
                      title: Text(
                        'Next page',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor(
                                themeFirebase?.theme.colorTextPrimary.value ??
                                    '')),
                      ),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _widgetOptions.elementAt(_selectedIndex),
            remoteConfig.isBannerVisible()
                ? Card(
                    elevation: 9,
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Text(
                        "Esto es una prueba",
                        // _remoteConfig.getString('banner_text').isNotEmpty
                        //     ? _remoteConfig.getString('banner_text')
                        //     : _defaultBannerText,
                        style: TextStyle(
                            fontSize: 30,
                            color: HexColor(
                                themeFirebase?.theme.colorTextSecondary.value ??
                                    '')),
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor:
            HexColor(themeFirebase?.theme.colorSecondary.value ?? ''),
        selectedItemColor:
            HexColor(themeFirebase?.theme.colorPrimary.value ?? ''),
        onTap: _onItemTapped,
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
