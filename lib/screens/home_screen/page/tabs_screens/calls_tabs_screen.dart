import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/user_models.dart';
import '../../../../utils/colours.dart';
import '../../../../utils/var.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {

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
        children: user
            .map(
              (e) => Padding(
                padding: (isIOS)
                    ? (e == user.last)
                    ? const EdgeInsets.only(
                    left: 15, right: 15, bottom: 200)
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
                    Row(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.name,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: (isIOS)
                                          ? (cupLight)
                                          ? Colors.black
                                          : Colors.white
                                          : Theme.of(context).textTheme.bodySmall?.color,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    e.time,
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
                            (isIOS)
                                ? Icon(
                                    CupertinoIcons.phone_solid,
                                    color: mainColor,
                                  )
                                : Icon(
                                    Icons.phone,
                                    color: mainColor,
                                  ),
                          ],
                        ),
                      ],
                    ),
                    (isIOS)
                        ? Divider(
                      thickness: 1,
                      color: (cupLight) ? Colors.grey.shade300 : Colors.grey,
                    )
                        : Container(),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
