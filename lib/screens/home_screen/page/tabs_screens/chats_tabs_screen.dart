import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/user_models.dart';
import '../../../../utils/colours.dart';
import '../../../../utils/var.dart';
import '../../../cupertino_home_screen/page/stepper_screen.dart';
import '../drawer_screen.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: user
                .map(
                  (e) => Padding(
                    padding: (isIOS)
                        ? (e == user.last)
                            ? const EdgeInsets.only(
                                left: 15, right: 15, bottom: 50)
                            : (e == user.first)
                                ? const EdgeInsets.only(
                                    left: 15, right: 15, top: 100)
                                : const EdgeInsets.only(left: 15, right: 15)
                        : (e == user.last)
                            ? const EdgeInsets.only(
                                left: 15, top: 15, right: 15, bottom: 150)
                            : (e == user.first)
                                ? const EdgeInsets.only(
                                    left: 15, right: 15, top: 10)
                                : const EdgeInsets.only(
                                    left: 15, right: 15, top: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            (isIOS)
                                ? showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoMyBottomSheet(e);
                                    },
                                  )
                                : showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    builder: (context) {
                                      return MyBottomSheet(e);
                                    },
                                  );
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                        radius: 30.r,
                                        backgroundColor: mainColor,
                                        backgroundImage: (e.isAsset)
                                            ? AssetImage(e.img)
                                            : FileImage(File(e.img))
                                                as ImageProvider),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 17),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.name,
                                            style: TextStyle(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500,
                                              color: (isIOS)
                                                  ? (cupLight)
                                                      ? Colors.black
                                                      : Colors.white
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.color,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            e.msg,
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          e.time,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        (isIOS)
                            ? Divider(
                                thickness: 1,
                                color: (cupLight)
                                    ? Colors.grey.shade300
                                    : Colors.grey,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          (isIOS)
              ? Padding(
                  padding:
                      const EdgeInsets.only(bottom: 150, left: 50, right: 50),
                  child: CupertinoButton(
                    color: mainColor,
                    padding:  const EdgeInsets.all(20),
                    child: const Icon(
                      CupertinoIcons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showCupertinoDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: (cupLight) ? Colors.white : Colors.black,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: StepperPage(),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget MyBottomSheet(e) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        color: Theme.of(context).textTheme.bodyMedium?.color,
      ),
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 70.r,
                backgroundColor: mainColor,
                backgroundImage: (e.isAsset)
                    ? AssetImage(e.img)
                    : FileImage(File(e.img))
                as ImageProvider),
            SizedBox(height: 10.h),
            Text(
              e.name,
              style: TextStyle(
                fontSize: 23.sp,
                color: mainColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              e.phone,
              style: TextStyle(
                fontSize: 18.sp,
                color: mainColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 40.h,
              width: MediaQuery.of(context).size.width * 0.8,
              child: (isIOS)
                  ? CupertinoButton(
                      child: const Text('Send Message'),
                      color: mainColor,
                      onPressed: () {},
                    )
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )),
                      child: const Text(
                        'Send Message',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 40.h,
              width: MediaQuery.of(context).size.width * 0.8,
              child: (isIOS)
                  ? CupertinoButton(
                      child: const Text('Cancel'),
                      color: mainColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )),
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 40.h,
              width: MediaQuery.of(context).size.width * 0.8,
              child: (isIOS)
                  ? CupertinoButton(
                      child: const Text('Delete Contact'),
                      color: mainColor,
                      onPressed: () {
                        setState(() {
                          user.remove(e);
                        });
                        Navigator.of(context).pop();
                      },
                    )
                  : ElevatedButton(
                      onPressed: () {
                        setState(() {
                          user.remove(e);
                        });
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: const Text(
                        'Delete Contact',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget CupertinoMyBottomSheet(e) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        color: (cupLight) ? Colors.white : Colors.black,
      ),
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 70.r,
                backgroundColor: mainColor,
                backgroundImage: (e.isAsset)
                    ? AssetImage(e.img)
                    : FileImage(File(e.img))
                as ImageProvider),
            SizedBox(height: 10.h),
            Text(
              e.name,
              style: TextStyle(
                fontSize: 23.sp,
                color: mainColor,
                fontWeight: FontWeight.w600,
              ),
            ),
             SizedBox(height: 5.h),
            Text(
              e.phone,
              style: TextStyle(
                fontSize: 18.sp,
                color: mainColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 40.h,
              width: MediaQuery.of(context).size.width * 0.8,
              child: (isIOS)
                  ? CupertinoButton(
                      child: const Text('Send Message'),
                      color: mainColor,
                      onPressed: () {},
                    )
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )),
                      child: Text(
                        'Send Message',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 40.h,
              width: MediaQuery.of(context).size.width * 0.8,
              child: (isIOS)
                  ? CupertinoButton(
                      child: const Text('Cancel'),
                      color: mainColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )),
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 40.h,
              width: MediaQuery.of(context).size.width * 0.8,
              child: (isIOS)
                  ? CupertinoButton(
                      child: const Text('Delete Contact'),
                      color: mainColor,
                      onPressed: () {
                        setState(() {
                          user.remove(e);
                        });
                        Navigator.of(context).pop();
                      },
                    )
                  : ElevatedButton(
                      onPressed: () {
                        setState(() {
                          user.remove(e);
                        });
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          )),
                      child: Text(
                        'Delete Contact',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
