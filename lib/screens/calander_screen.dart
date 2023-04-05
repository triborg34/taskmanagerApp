import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/screens/newtask_screen.dart';
import 'package:taskmannager/utils/newfuncs.dart';

class CalanderView extends StatefulWidget {
  const CalanderView({super.key});

  @override
  State<CalanderView> createState() => _CalanderViewState();
}

class _CalanderViewState extends State<CalanderView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focuesdtime = DateTime.now();
  DateTime? _selctedday;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "تقویم",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.calendar_today)
          ]),
        ),
        body: TableCalendar(
            selectedDayPredicate: (day) {
              return isSameDay(_selctedday, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selctedday, selectedDay)) {
                setState(() {
                  _selctedday = _selctedday;
                  _focuesdtime = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focuesdtime = focusedDay;
            },
            onDayLongPressed: (selectedDay, focusedDay) {
              Get.bottomSheet(Container(
                color: Colors.white,
                child: Wrap(children: [
                  ListTile(
                    onTap: () {
                      Get.find<TimeAndDateController>().displayDay =
                          selectedDay.day.toString();
                      Get.find<TimeAndDateController>().currentDateTime =
                          selectedDay;
                    newproj(selectedDay.day.toString(),selectedDay);
                      Get.toNamed('/newproj');
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("اضافه کردن پروژه به این تاریخ"),
                      ],
                    ),
                  ),
                  ListTile(
                      onTap: (() {
                        // Get.find<TaskController>().defuiltTime =
                        //     "${selectedDay.year}/${selectedDay.month}/${selectedDay.day}";

                               String defuiltTime =
                            "${selectedDay.year}/${selectedDay.month}/${selectedDay.day}";
                            newtask(defuiltTime);
                        Get.toNamed('/newtask');
                      }),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("اضافه کردن کار به این تاریخ"),
                        ],
                      ))
                ]),
              ));
              setState(() {
                _selctedday = selectedDay;
                _focuesdtime = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(),
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime(2050),
            calendarFormat: _calendarFormat,
            focusedDay: _focuesdtime),
      ),
    );
  }
}
