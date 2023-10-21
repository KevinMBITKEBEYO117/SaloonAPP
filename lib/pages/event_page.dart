import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  final events = [
    {
      "speaker": "Lior chamla",
      "date": "13h à 13h30",
      "subject": "Le code legacy",
      "avatar": "Lior"
    },
    {
      "speaker": "Damien",
      "date": "17h30 à 13h30",
      "subject": "GIT BLAME legacy",
      "avatar": "damien"
    },
    {
      "speaker": "Defend chamla",
      "date": "18h à 13h30",
      "subject": "A la découverte",
      "avatar": "defendinteligense",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index){
            final event = events[index];
            final speaker = event['speaker'];
            final date = event['date'];
            final subject = event['subject'];
            return Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text("$speaker $date"),
                subtitle: Text("$subject"),
                trailing: Icon(Icons.more_vert),
              ),
            );
          }

      ),
    );
  }
}
