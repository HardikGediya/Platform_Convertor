import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor_app/screens/home_screen/page/tabs_screens/calls_tabs_screen.dart';
import 'package:platform_convertor_app/screens/home_screen/page/tabs_screens/chats_tabs_screen.dart';
import 'package:platform_convertor_app/screens/home_screen/page/tabs_screens/settings_tabs_screen.dart';

import '../../../models/user_models.dart';
import '../../../utils/appRoutes.dart';
import '../../../utils/colours.dart';
import '../../../utils/string.dart';
import '../../../utils/var.dart';
import 'drawer_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  PageController _pageController = PageController();

  int _currentindex = 0;
  int _currentStep = 0;

  final _picker = ImagePicker();
  String? image;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: _currentindex,
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 3,
          bottom: TabBar(
            onTap: (val) {
              _pageController.animateToPage(
                val,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              setState(() {
                _currentindex = val;
              });
            },
            controller: _tabController,
            indicatorColor: Colors.white,
            indicatorWeight: 3.5,
            indicatorPadding: EdgeInsets.only(left: 10.w, right: 10.w),
            labelStyle:
            TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
            tabs: const [
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "CALLS",
              ),
              Tab(
                text: "SETTINGS",
              ),
            ],
          ),
          title: Text(platformConvertorApp),
          actions: [
            Switch(
              value: isIOS,
              inactiveThumbImage: const AssetImage("assets/icons/android.png"),
              onChanged: (val) {
                setState(() {
                  isIOS = val;
                });
              },
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (val) {
            _tabController.animateTo(val);
            setState(() {
              _currentindex = val;
            });
          },
          children: const [
            ChatsPage(),
            CallsPage(),
            SettingsPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            (_currentindex == 0)
                ? showDialog(
                    context: context,
                    builder: (context) {
                      return Builder(builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          content: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.47,
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: Stepper(
                              currentStep: _currentStep,
                              onStepTapped: (val) {
                                setState(() {
                                  _currentStep = val;
                                });
                              },
                              controlsBuilder: (context, details) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: mainColor,
                                          padding: const EdgeInsets.all(8),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (_currentStep < 2) {
                                              _currentStep++;
                                            } else {
                                              name = _nameController.text;
                                              description =
                                                  _descriptionController.text;
                                              user.add(
                                                User(
                                                  id: user.length + 1,
                                                  phone: '+91 25412 25362',
                                                  img: (image == null) ? 'assets/images/user.png': image as String,
                                                  time: formattedTime,
                                                  msg: description!,
                                                  name: name!,
                                                  isAsset: (image == null) ? true : false,
                                                ),
                                              );
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      AppRoutes().homePage,
                                                      (route) => false);
                                            }
                                          });
                                        },
                                        child: Text(
                                          (_currentStep == 2)
                                              ? 'ADD'
                                              : 'CONTINUE',
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          padding: const EdgeInsets.all(8),
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (_currentStep > 0) {
                                              _currentStep--;
                                            }
                                          });
                                        },
                                        child: Text(
                                          'CANCEL',
                                          style: TextStyle(
                                              color: Colors.grey.shade600),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              steps: <Step>[
                                Step(
                                  isActive: (_currentStep >= 0) ? true : false,
                                  title: const Text('PROFILE PHOTO'),
                                  subtitle: const Text('Add profile photo'),
                                  content: Container(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap: () async {
                                        XFile? xfile = await _picker.pickImage(
                                            source: ImageSource.gallery);
                                        setState(() {
                                          image = xfile!.path;
                                        });
                                      },
                                      child: Stack(
                                        alignment: const Alignment(0.8, 1),
                                        children: [
                                          CircleAvatar(
                                            radius: 60.r,
                                            backgroundColor:
                                                const Color(0xffe3D3fd),
                                            backgroundImage: (image != null)
                                                ? FileImage(File(image!))
                                                : null,
                                            child: (image == null)
                                                ? Image.asset(
                                                    'assets/images/add-photo.png',
                                                    scale: 3,
                                                  )
                                                : Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Step(
                                  isActive: (_currentStep >= 1) ? true : false,
                                  title: const Text('NAME'),
                                  subtitle: const Text('Enter Name'),
                                  content: TextField(
                                    controller: _nameController,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Enter your name"),
                                  ),
                                ),
                                Step(
                                  isActive: (_currentStep >= 2) ? true : false,
                                  title: const Text('DESCRIPTION'),
                                  subtitle: const Text('Enter Description'),
                                  content: TextField(
                                    controller: _descriptionController,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Enter description"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                    },
                  )
                : null;
          },
          backgroundColor: mainColor,
          child: (_currentindex == 0)
              ? const Icon(Icons.add)
              : (_currentindex == 2)
                  ? const Icon(Icons.settings)
                  : const Icon(Icons.phone),
        ),
      ),
    );
  }
}
