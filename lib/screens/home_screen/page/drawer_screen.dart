import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/user_models.dart';
import '../../../utils/colours.dart';
import '../../../utils/var.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height,
      color: (isIOS)
          ? (cupLight)
              ? Colors.white
              : Colors.black
          : Theme.of(context).textTheme.bodyMedium?.color,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: mainColor,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10,top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [
                      CircleAvatar(
                        radius: 45.r,
                        backgroundImage: const AssetImage(
                          'assets/images/myPic.jpg',
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Hardik Gediya',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        '+91 8460711716',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.w,
                    top: 20.h,
                  ),
                  child: Row(
                    children: [
                      (isIOS)
                          ? const Icon(
                              CupertinoIcons.group_solid,
                              size: 25,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.people,
                              size: 25,
                              color: Colors.grey,
                            ),
                       SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'New Group',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: (isIOS)
                              ? (cupLight)
                                  ? Colors.black
                                  : Colors.white
                              : Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 20,
                  ),
                  child: Row(
                    children: [
                      (isIOS)
                          ? const Icon(
                              CupertinoIcons.profile_circled,
                              size: 25,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.account_circle_outlined,
                              size: 25,
                              color: Colors.grey,
                            ),
                       SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'Contacts',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: (isIOS)
                              ? (cupLight)
                                  ? Colors.black
                                  : Colors.white
                              : Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 20,
                  ),
                  child: Row(
                    children: [
                      (isIOS)
                          ? const Icon(
                              CupertinoIcons.phone,
                              size: 25,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.phone,
                              size: 25,
                              color: Colors.grey,
                            ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'Calls',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: (isIOS)
                              ? (cupLight)
                                  ? Colors.black
                                  : Colors.white
                              : Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 20,
                  ),
                  child: Row(
                    children: [
                      (isIOS)
                          ? const Icon(
                              CupertinoIcons.bookmark,
                              size: 25,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.bookmarks,
                              size: 25,
                              color: Colors.grey,
                            ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'Saved Messages',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: (isIOS)
                              ? (cupLight)
                                  ? Colors.black
                                  : Colors.white
                              : Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 20,
                  ),
                  child: Row(
                    children: [
                      (isIOS)
                          ? const Icon(
                              CupertinoIcons.settings,
                              size: 25,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.settings,
                              size: 25,
                              color: Colors.grey,
                            ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: (isIOS)
                              ? (cupLight)
                                  ? Colors.black
                                  : Colors.white
                              : Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 20,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isIOS == true) {
                              cupLight = !cupLight;
                            } else {
                              light = !light;
                            }
                          });
                        },
                        child: CircleAvatar(
                          radius: 17.r,
                          backgroundColor: Colors.grey.shade300,
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor:
                                Theme.of(context).textTheme.bodySmall?.color,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Change Theme',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: (isIOS)
                              ? (cupLight)
                                  ? Colors.black
                                  : Colors.white
                              : Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
