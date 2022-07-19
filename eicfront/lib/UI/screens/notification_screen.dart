import 'dart:convert';

import 'package:eicfront/providers/state.dart';
import 'package:eicfront/view_model/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // late Future<List<NotificationsModel>> futureNotification;
  LoginViewModel loginViewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();
  }

//   String notificationsQuery = '''
//   {
//   allNotifications {
//     nodes {
//       message
//       deleted
//       id
//       urgency
//       userId
//     }
//   }
// }

//   ''';
  String notificationsQuery = '''
  {
  allNotifications {
    nodes {
      message
      deleted
      id
      urgency
      userId
      userByUserId {
        email
        username
      }
    }
  }
}


  ''';

  @override
  Widget build(BuildContext context) {
    var userToken = loginViewModel.getToken();
    String token;

    return Scaffold(
      body: Query(
          options: QueryOptions(
            document: gql(notificationsQuery),
            //variables: {'userId': "c2a7e0ba-11bc-4efc-beca-0a2239c82045"}),
            // variables: {'userId': "c2a7e0ba-11bc-4efc-beca-0a2239c82045"}
          ),
          builder: (
            QueryResult result, {
            Refetch? refetch,
            FetchMore? fetchMore,
          }) {
            print(result);
            if (result.isLoading) {
              return const Center(
                child: Text('Loading..'),
              );
            }
            final List notifications =
                result.data!['allNotifications']?['nodes'];
            print(notifications.length);

            if (notifications == null || notifications.isEmpty) {
              return const Center(
                child: Text('no notifications'),
              );
            } else {
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(24),
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];

                    return Stack(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 20,
                            right: 0,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 10),
                                  color: Colors.grey.shade300,
                                  blurRadius: 30,
                                ),
                              ]),
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        notification['message'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Color(0xFF005288),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            }
          }),
    );
  }
}
