import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/user_models.dart';
import '../../../utils/colours.dart';
import 'cupertino_home_screen.dart';

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int currentStep = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final _picker = ImagePicker();
  String? image;

  @override
  Widget build(BuildContext context) {
    return _buildStepper(StepperType.vertical);
  }

  Widget _buildStepper(StepperType type) {
    final canCancel = currentStep > 0;
    final canContinue = currentStep < 3;
    return SingleChildScrollView(
      child: Container(
        color: (cupLight) ? Colors.white : Colors.black,
        child: Column(
          children: [
            CupertinoStepper(
              physics: const BouncingScrollPhysics(),
              currentStep: currentStep,
              onStepTapped: (val) {
                setState(() {
                  currentStep = val;
                });
              },
              controlsBuilder: (context, details) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: mainColor,
                        onPressed: () {
                          setState(() {
                            if (currentStep < 2) {
                              currentStep++;
                            } else {
                              name = nameController.text;
                              description = descriptionController.text;
                              user.add(
                                User(
                                  id: user.length + 1,
                                  phone: '+91 25412 25362',
                                  img: (image == null)
                                      ? 'assets/images/user.png'
                                      : image as String,
                                  time: formattedTime,
                                  msg: description!,
                                  name: name!,
                                  isAsset: (image == null) ? true : false,
                                ),
                              );
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const CupertinoHomePage(),
                                ),
                              );
                            }
                          });
                        },
                        child: Text(
                          (currentStep == 2) ? 'ADD' : 'CONTINUE',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: (cupLight) ? Colors.white : Colors.black,
                        onPressed: () {
                          setState(() {
                            if (currentStep > 0) {
                              currentStep--;
                            }
                          });
                        },
                        child: Text(
                          'CANCEL',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                    ],
                  ),
                );
              },
              steps: [
                Step(
                  isActive: (currentStep >= 0) ? true : false,
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
                            backgroundColor: const Color(0xffe3D3fd),
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
                  isActive: (currentStep >= 1) ? true : false,
                  title: const Text('NAME'),
                  subtitle: const Text('Enter Name'),
                  content: CupertinoTextField(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (cupLight) ? Colors.black : Colors.white),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    controller: nameController,
                  ),
                ),
                Step(
                  isActive: (currentStep >= 2) ? true : false,
                  title: const Text('DESCRIPTION'),
                  subtitle: const Text('Enter Description'),
                  content: CupertinoTextField(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (cupLight) ? Colors.black : Colors.white),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    controller: descriptionController,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Step _buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
  }) {
    return Step(
      title: title,
      subtitle: Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: Container(
        color: CupertinoColors.systemGrey,
        height: 100,
      ),
    );
  }
}
