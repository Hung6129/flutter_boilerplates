import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/themes/app_theme.dart';
import 'package:flutter_boilerplates/features/main/boilerplate_page.dart';

import 'feature_demo_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static openPushRemove(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const MainPage(),
      ),
      (route) => false,
    );
  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      Boilerplate(),
      FeatureDemoPage(),
      // Text('Messages'),
    ];

    List<Widget> icons = const <Widget>[
      NavigationDestination(
        selectedIcon: Icon(
          Icons.widgets,
          color: Colors.white,
        ),
        icon: Icon(Icons.widgets),
        label: 'Widgets',
      ),
      NavigationDestination(
        selectedIcon: Icon(
          Icons.functions_rounded,
          color: Colors.white,
        ),
        icon: Badge(
          child: Icon(
            Icons.functions_rounded,
          ),
        ),
        label: 'Features',
      ),
      // NavigationDestination(
      //   selectedIcon: Icon(
      //     Icons.messenger_sharp,
      //     color: Colors.white,
      //   ),
      //   icon: Badge(
      //     label: Text('2'),
      //     child: Icon(
      //       Icons.messenger_sharp,
      //     ),
      //   ),
      //   label: 'Messages',
      // ),
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
