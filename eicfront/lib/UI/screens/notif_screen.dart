import 'dart:convert';

import 'package:eicfront/models/notification_model.dart';
import 'package:eicfront/providers/state.dart';
import 'package:eicfront/view_model/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../queries/queries.dart';

class NotifScreen extends StatefulWidget {
  NotifScreen({Key? key}) : super(key: key);

  @override
  _NotifScreenState createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {
  // late Future<List<NotificationsModel>> futureNotification;
  LoginViewModel loginViewModel = LoginViewModel();

  //late Future<String?> userToken;

  //String token = await userToken;
  @override
  void initState() {
    super.initState();
    // Future<String?> userToken = loginViewModel.getToken();
    // print("user id: $userToken");
    // futureNotification = networkHandler.fetchPost();
    final secure = FlutterSecureStorage();
    var token = secure.read(key: TOKEN_STORAGE);
    print("thius token: $token");
  }

  String getUserId = '''
  query getUserId {
  currentUserId
}

  ''';

  // Future<List<NotificationModel>> getNotifications() async {
  //   print("get notifiactions");
  //   List<NotificationModel>? notifications = null;
  //   QueriesMutations queryMutation = QueriesMutations();
  //   GraphQLConfiguration graphQLConfiguration
  // }

  @override
  Widget build(BuildContext context) {
    var userToken = loginViewModel.getToken();
    print("this the selected user:");
    print(selectedUser.state);

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff0C4861),
      //   title: Text(token),
      //   centerTitle: true,
      // ),
      body: Query(
          options: QueryOptions(
            document: gql(getUserId),
            //variables: {'userId': "110e5ce6-f08a-43ec-bd69-30ce91573d1a"}
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
            final List notifications = result.data!['data'];

            if (notifications == null || notifications.isEmpty) {
              return const Center(
                child: Text('no notifications'),
              );
            } else {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
                                        notification['currentUserId'],
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
