import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colours.dart';
import '../../../utils/string.dart';
import '../../../utils/var.dart';
import '../../home_screen/page/drawer_screen.dart';
import '../../home_screen/page/tabs_screens/calls_tabs_screen.dart';
import '../../home_screen/page/tabs_screens/chats_tabs_screen.dart';
import '../../home_screen/page/tabs_screens/settings_tabs_screen.dart';

class CupertinoHomePage extends StatefulWidget {
  const CupertinoHomePage({Key? key}) : super(key: key);

  @override
  State<CupertinoHomePage> createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Builder(builder: (context) {
          return CupertinoButton(
            child: Icon(
              Icons.menu,
              color: mainColor,
              size: 25,
            ),
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return Row(
                    children: [
                      const Expanded(
                        flex: 7,
                        child: MyDrawer(),
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        }),
        middle: Text(platformConvertorApp),
        trailing: Transform.scale(
          scale: 0.9,
          child: CupertinoSwitch(
            activeColor: mainColor,
            value: isIOS,
            onChanged: (val) {
              setState(() {
                isIOS = val;
              });
            },
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          IndexedStack(
            index: index,
            children: const [
              ChatsPage(),
              CallsPage(),
              SettingsPage(),
            ],
          ),
          Column(
            children: [
              const Spacer(),
              CupertinoTabBar(
                currentIndex: index,
                onTap: (val) {
                  setState(() {
                    index = val;
                  });
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    activeIcon: Icon(CupertinoIcons.chat_bubble_2_fill),
                    icon: Icon(CupertinoIcons.chat_bubble_2),
                    label: 'Chats',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(CupertinoIcons.phone_solid),
                    icon: Icon(CupertinoIcons.phone),
                    label: 'Calls',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(CupertinoIcons.settings_solid),
                    icon: Icon(CupertinoIcons.settings),
                    label: 'Settings',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
