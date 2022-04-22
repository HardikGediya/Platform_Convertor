import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../models/user_models.dart';
import '../../../../utils/colours.dart';
import '../../../../utils/textStyle.dart';
import '../../../../utils/var.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  DateTime _currentDate = DateTime.now();
  TimeOfDay _currentTime = TimeOfDay.now();

  DateTime? pickedDate;
  TimeOfDay? pickedTime;
  String date = DateFormat("d, MMMM y").format(DateTime.now());
  String time = (isIOS)
      ? (DateTime.now().hour > 12)
          ? (DateTime.now().hour == 12)
              ? "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second} ${(DateTime.now().hour > 12) ? 'PM' : 'AM'}"
              : "${DateTime.now().hour - 12}:${DateTime.now().minute}:${DateTime.now().second} ${(DateTime.now().hour > 12) ? 'PM' : 'AM'}"
          : "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second} ${(DateTime.now().hour > 12) ? 'PM' : 'AM'}"
      : (DateTime.now().hour > 12)
          ? "${DateTime.now().hour - 12}:${DateTime.now().minute}:${DateTime.now().second} ${(DateTime.now().hour > 12) ? 'PM' : 'AM'}"
          : "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second} ${(DateTime.now().hour > 12) ? 'PM' : 'AM'}";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: (isIOS)
            ? const EdgeInsets.only(right: 20, top: 100, left: 20, bottom: 150)
            : const EdgeInsets.only(right: 20, top: 20, left: 20, bottom: 100),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date',
                  style: settingsStyle,
                ),
                Text(
                  date,
                  style: settingsStyle,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: (isIOS) ? 50.h : 40.h,
              child: (isIOS)
                  ? CupertinoButton(
                      onPressed: () async {
                        (isIOS == false)
                            ? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: _currentDate,
                                firstDate: DateTime(1999),
                                lastDate: DateTime(2025),
                                selectableDayPredicate: (DateTime day) {
                                  return (day.isBefore(DateTime.now()
                                              .add(const Duration(days: 10))) &&
                                          day.isAfter(DateTime.now().subtract(
                                              const Duration(days: 1))))
                                      ? true
                                      : false;
                                })
                            : await showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 250.h,
                                    color: Colors.white,
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      initialDateTime: _currentDate,
                                      maximumYear: 2030,
                                      minimumYear: 1990,
                                      backgroundColor: (cupLight)
                                          ? Colors.white
                                          : Colors.black,
                                      onDateTimeChanged: (val) {
                                        setState(() {
                                          _currentDate = val;
                                        });
                                      },
                                    ),
                                  );
                                });

                        setState(() {
                          date = (isIOS)
                              ? DateFormat("d, MMMM y").format(_currentDate)
                              : DateFormat("d, MMMM y").format(pickedDate!);
                        });
                      },
                      color: mainColor,
                      child: const Text('Change Date'),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        (isIOS == false)
                            ? pickedDate = await showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: mainColor,
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          primary:
                                              Colors.red, // button text color
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                                context: context,
                                initialDate: _currentDate,
                                firstDate: DateTime(1999),
                                lastDate: DateTime(2025),
                                selectableDayPredicate: (DateTime day) {
                                  return (day.isBefore(DateTime.now()
                                              .add(const Duration(days: 10))) &&
                                          day.isAfter(DateTime.now().subtract(
                                              const Duration(days: 1))))
                                      ? true
                                      : false;
                                })
                            : await showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 250.h,
                                    color: Colors.white,
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      initialDateTime: _currentDate,
                                      maximumYear: 2030,
                                      minimumYear: 1990,
                                      backgroundColor: (cupLight)
                                          ? Colors.white
                                          : Colors.black,
                                      onDateTimeChanged: (val) {
                                        setState(() {
                                          _currentDate = val;
                                        });
                                      },
                                    ),
                                  );
                                });

                        setState(() {
                          date = (isIOS)
                              ? DateFormat("d, MMMM y").format(_currentDate)
                              : DateFormat("d, MMMM y").format(pickedDate!);
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(mainColor),
                      ),
                      child: Text(
                        'Change Date',
                        style: settingsButtonStyle,
                      ),
                    ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Time',
                  style: settingsStyle,
                ),
                Text(
                  time,
                  style: settingsStyle,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: (isIOS) ? 50.h : 40.h,
              child: (isIOS)
                  ? CupertinoButton(
                      onPressed: () async {
                        (isIOS == false)
                            ? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: _currentTime,
                                confirmText: "Confirm",
                                cancelText: "Dismiss",
                                helpText: "Choose your desired time",
                                initialEntryMode: TimePickerEntryMode.dial,
                                errorInvalidText: "Enter proper time",
                              )
                            : await showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 250.h,
                                    color: Colors.white,
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.time,
                                      initialDateTime: _currentDate,
                                      maximumYear: 2030,
                                      minimumYear: 1990,
                                      backgroundColor: (cupLight)
                                          ? Colors.white
                                          : Colors.black,
                                      onDateTimeChanged: (val) {
                                        setState(() {
                                          _currentDate = val;
                                        });
                                      },
                                    ),
                                  );
                                });

                        (isIOS)
                            ? setState(() {
                                time = (_currentDate.hour > 12)
                                    ? (_currentDate.hour == 12)
                                        ? "${_currentDate.hour}:${_currentDate.minute}:${_currentDate.second} ${(_currentDate.hour > 12) ? 'PM' : 'AM'}"
                                        : "${_currentDate.hour - 12}:${_currentDate.minute}:${_currentDate.second} ${(_currentDate.hour > 12) ? 'PM' : 'AM'}"
                                    : "${_currentDate.hour}:${_currentDate.minute}:${DateTime.now().second} ${(_currentDate.hour > 12) ? 'PM' : 'AM'}";
                              })
                            : setState(() {
                                time = (pickedTime!.periodOffset == 12)
                                    ? (pickedTime!.hour == 12)
                                        ? "${pickedTime!.hour}:${pickedTime!.minute}:${DateTime.now().second} ${pickedTime!.period.name}"
                                        : "${pickedTime!.hour - 12}:${pickedTime!.minute}:${DateTime.now().second} ${pickedTime!.period.name}"
                                    : "${pickedTime!.hour}:${pickedTime!.minute}:${DateTime.now().second} ${pickedTime!.period.name}";
                              });
                      },
                      color: mainColor,
                      child: const Text('Change Time'),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        (isIOS == false)
                            ? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: _currentTime,
                                confirmText: "Confirm",
                                cancelText: "Dismiss",
                                helpText: "Choose your desired time",
                                initialEntryMode: TimePickerEntryMode.dial,
                                errorInvalidText: "Enter proper time",
                              )
                            : await showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 250.h,
                                    color: Colors.white,
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.time,
                                      initialDateTime: _currentDate,
                                      maximumYear: 2030,
                                      minimumYear: 1990,
                                      backgroundColor: (cupLight)
                                          ? Colors.white
                                          : Colors.black,
                                      onDateTimeChanged: (val) {
                                        setState(() {
                                          _currentDate = val;
                                        });
                                      },
                                    ),
                                  );
                                });

                        (isIOS)
                            ? setState(() {
                                time = (_currentDate.hour > 12)
                                    ? (_currentDate.hour == 12)
                                        ? "${_currentDate.hour}:${_currentDate.minute}:${_currentDate.second} ${(_currentDate.hour > 12) ? 'PM' : 'AM'}"
                                        : "${_currentDate.hour - 12}:${_currentDate.minute}:${_currentDate.second} ${(_currentDate.hour > 12) ? 'PM' : 'AM'}"
                                    : "${_currentDate.hour}:${_currentDate.minute}:${DateTime.now().second} ${(_currentDate.hour > 12) ? 'PM' : 'AM'}";
                              })
                            : setState(() {
                                time = (pickedTime!.periodOffset == 12)
                                    ? (pickedTime!.hour == 12)
                                        ? "${pickedTime!.hour}:${pickedTime!.minute}:${DateTime.now().second} ${pickedTime!.period.name}"
                                        : "${pickedTime!.hour - 12}:${pickedTime!.minute}:${DateTime.now().second} ${pickedTime!.period.name}"
                                    : "${pickedTime!.hour}:${pickedTime!.minute}:${DateTime.now().second} ${pickedTime!.period.name}";
                              });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(mainColor),
                      ),
                      child: Text(
                        'Change Time',
                        style: settingsButtonStyle,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
