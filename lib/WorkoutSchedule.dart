import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class WorkoutSchedule extends StatelessWidget {
  const WorkoutSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout Schedule"),
        centerTitle: true,
      ),
      body:ScheduleBody()
    );
  }
}



class ScheduleBody extends StatefulWidget {
  const ScheduleBody({Key? key}) : super(key: key);

  @override
  State<ScheduleBody> createState() => _ScheduleBodyState();
}

class Meeting {
  final DateTime date;
  final String title;
  final String description;

  Meeting({
    required this.date,
    required this.title,
    required this.description,
  });
}

class _ScheduleBodyState extends State<ScheduleBody> {
  final List<Appointment> appointments = <Appointment>[];

  // Define a list to hold meetings
  final List<Meeting> _meetings = [];

  @override
  void initState() {
    super.initState();
    // Populate meetings
    /*  _meetings.add(Meeting(
      date: DateTime.now().add(Duration(hours: 1)), // Example date: 1 hour from now
      title: 'Meeting 2',
      description: 'Description for Meeting 2',
    ));
    _meetings.add(Meeting(
      date: DateTime.now().add(Duration(hours: 2)), // Example date: 2 hours from now
      title: 'Meeting 3',
      description: 'Description for Meeting 3',
    ));*/
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfCalendar(
            view: CalendarView.day,
            dataSource: MeetingDataSource(_getDataSource()),
            allowDragAndDrop: true,
            allowAppointmentResize: true,
            onDragEnd: (details) {
              print(details.appointment);
            },
            onTap: (CalendarTapDetails details) {
              print(details.date);
              if (details.date != null) {
                final Meeting? meeting = _getMeetingDetails(details.date!);

                // If there is a meeting, print its details
                if (meeting != null) {
                  print('Meeting Details:');
                  print('Title: ${meeting.title}');
                  print('Description: ${meeting.description}');
                  // Print other details as needed
                }
              }
            },
          ),
        ),
      ],
    );
  }

  List<Appointment> _getDataSource() {
    // Add appointments based on meetings
    appointments.clear(); // Clear existing appointments
    for (Meeting meeting in _meetings) {
      appointments.add(Appointment(
        startTime: meeting.date,
        endTime: meeting.date.add(Duration(hours: 1)), // Assuming meetings are 1 hour long
        subject: meeting.title,
        color: Colors.blue,
      ));
    }
    return appointments;
  }



  Meeting? _getMeetingDetails(DateTime date) {
    // Search for a meeting on the given date
    for (Meeting meeting in _meetings) {
      if (meeting.date.year == date.year &&
          meeting.date.month == date.month &&
          meeting.date.day == date.day) {
        return meeting;
      }
    }
    return null; // Return null if no meeting found on the given date
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

