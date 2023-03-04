import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:test1/Model/event_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Future getUserData(String token) {
    EventsModel eventsModel;
    var myHeaders = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer ' + token,
    };

    Uri apiUrl = Uri.parse("https://conference.bmssystems.org/api/guest-data");
    return http.get(apiUrl, headers: myHeaders).then((data) {
      var outputFormat = DateFormat('MM/dd/yyyy HH:mm');
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        List<EventsModel> events = [];
        for (var tempEvent in jsonData["AppInfo"]) {
          //event date
          DateTime eventDate, endDate;

          if (tempEvent['event_date'] != null) {
            eventDate = outputFormat.parse(tempEvent['event_date']);
          } else {
            eventDate = DateTime.now();
          }

          if (tempEvent['end_date'] != null) {
            endDate = outputFormat.parse(tempEvent['end_date']);
          } else {
            endDate = DateTime.now();
          }
          print("event time :$eventDate");
          print("end time :$endDate");

          //event
          /* var event = Event(
              id: tempEvent['id'] ?? 0,
              name: tempEvent['app_name'] ?? "",
              splashImageUrl: tempEvent['splash_screen_file_path'] == null
                  ? DEFAULTSPLASHIMAGEURL
                  : APIROOT + tempEvent['splash_screen_file_path'],
              logoImageUrl: tempEvent['logo_file_path'] == null
                  ? DEFAULTLOGOIMAGEURL
                  : APIROOT + tempEvent['logo_file_path'],
              date: eventDate,
              endDate: endDate,
              location: tempEvent['event_location'] ?? "",
              lattitude: tempEvent['lattitude'] == null
                  ? 0.0
                  : double.parse(tempEvent['lattitude']),
              longitude: tempEvent['longitude'] == null
                  ? 0.0
                  : double.parse(tempEvent['longitude']),
              colorValue: tempEvent['color_value'] ?? DEFAULTICONCOLOR,
              description: tempEvent['desc'] ?? "",
              overView: overview);*/
          /*EventsModel(
              id: tempEvent['id'],
              appName: tempEvent['app_name'],
              desc: tempEvent['desc'],
              status: tempEvent["status"],
              userId: tempEvent["user_id"],
              eventDate: (tempEvent["event_date"]),
              endDate: tempEvent["end_date"],
              eventLocation: tempEvent["event_location"],
              accessCode: tempEvent["access_code"],
              createdAt: tempEvent["created_at"],
              updatedAt: tempEvent["updated_at"],
              appSpecificUsersId: tempEvent["app_specific_users_id"],
              appinfoId: tempEvent["appinfo_id"]);*/
          eventsModel = EventsModel.fromJson(tempEvent);

          events.add(eventsModel);
          print("data from temp: ${tempEvent}");
        }
        print("All the data");
        print(jsonData);
        return events;
      }
    });
  }

  var token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTJlZjA2NDBmMTBjMmFhMjg0ZDMwZGFjMTA4NTFhYzZlMzRkNGNiNTdmYWNlNzQwMjkzMzM4OWI1MzQ2MmMzYzA2MTdiMWZkYmRkOTE4YzgiLCJpYXQiOjE2Nzc3NTYxNTMuMjIyMDY1LCJuYmYiOjE2Nzc3NTYxNTMuMjIyMDY5LCJleHAiOjE3MDkzNzg1NTMuMjE3NDcsInN1YiI6IjIyMSIsInNjb3BlcyI6W119.cZPceyYFQTtt_ih5cBgwoj6I68BeCyCAl7LuoLAZdtdiPYRjE1ri-wwgtlIQKDkua9tp53zBoa2ERHOeXxN07Y06gfd4hpIcEeNFTg80Fz35Oh1d2Dwn3VSVgUcWYLkU2lJt7jA3jjhhi1lbb3BjhKs6VfQAi-m2qBbi_THXi8_nXzYk1HuUxHHx8EBgpdE2BHPNjajkTB3Z8GYgl5z15Rte-8-maO7X05LWsYhg9G1nsc4ANN2oUkMy_eNlLXhxL3H8zndKFCWz6VmW96IDrzZ50vhsJ-LwP4eJMP2gPrP-pP7cIl2p8jHPmxJmTGEX-tixBwEtj1jtqmjvsROBiULDnHVJ_7ZHJAZbwMiAVPksx3pogikJDrml6ssHAUXZBEs8aaMDK49yWkc0SmVLz7dzo8o0vHOIuL3AziboFaDVVHOltNzhMjs941eF8TD6cJjLtlAuN-G8iAba0WXGwFzzTuHlmJMQGICOg1MRls1H6jlcUwxw9mUeYBzTyYECEC2TZlS-MQYkq_r_wP0gXg1oVHyOyhn1sOPasTR5zm8cNphLfHHJdE3KOrwXDXooGP7xqq-4oSVwDTTF1MoNhS6rVhjxuBIEa7_vkGq7ZqvJf62nngqLP31w_7118dQvJc8Ey-MmCfOaDIS2g3XzULf36GjxAbWfUhfodzuBZgo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getUserData(token);
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          elevation: 0,
          title: Text("local data base try"),
        ),
        body: FutureBuilder(
          future: getUserData(token),
          builder: (context, snapshot) => Container(
            child: Text("${snapshot.data}"),
          ),
        ));
  }
}