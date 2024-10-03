import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/themes/app_theme.dart';
import 'package:flutter_boilerplates/features/boilerplate.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      Boilerplate(),
      Text('Notifications'),
      Text('Messages'),
    ];

    List<Widget> icons = const <Widget>[
      NavigationDestination(
        selectedIcon: Icon(Icons.home),
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      NavigationDestination(
        icon: Badge(child: Icon(Icons.notifications_sharp)),
        label: 'Notifications',
      ),
      NavigationDestination(
        icon: Badge(
          label: Text('2'),
          child: Icon(Icons.messenger_sharp),
        ),
        label: 'Messages',
      ),
    ];
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: AppColors.get().primaryColor,
        backgroundColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: icons,
      ),
      body: pages[currentPageIndex],
    );
  }
}
