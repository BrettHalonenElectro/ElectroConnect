import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserDevicesScreen extends StatefulWidget {
  UserDevicesScreen({Key? key}) : super(key: key);

  @override
  _UserDevicesScreenState createState() => _UserDevicesScreenState();
}

class _UserDevicesScreenState extends State<UserDevicesScreen> {
  @override
  void initState() {
    super.initState();
  }

  String query = '''
  query allBoiler {
  allBoilers {
    nodes {
      boilerName
      deviceModel
      kwRating
      userId
      powerRating
      phaseRating
    }
  }
}


  ''';

  // void viewDiagnosticInformation() {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) =>
  //               DiagnosticInformationScreen(deviceId: dataModel.id)));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Boiler'),
        backgroundColor: Color(0xff7cae41),
      ),
      body: Query(
          options: QueryOptions(document: gql(query)),
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
            final List boilers = result.data!['allBoilers']?['nodes'];

            if (boilers == null || boilers.isEmpty) {
              return const Center(
                child: Text('no Boilers'),
              );
            } else {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(24),
                  itemCount: boilers.length,
                  itemBuilder: (context, index) {
                    final boiler = boilers[index];

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
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Name: ' + boiler['boilerName'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color(0xFF005288),
                                            ),
                                          ),
                                          Text(
                                            'Boiler Model: ' +
                                                boiler['deviceModel'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color(0xFF005288),
                                            ),
                                          ),
                                          Text(
                                            'KW Rating: ${boiler['kwRating']}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color(0xFF005288),
                                            ),
                                          ),
                                          Text(
                                            'Phase Rating: ' +
                                                boiler['phaseRating'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color(0xFF005288),
                                            ),
                                          ),
                                          Text(
                                            'Power Rating: ${boiler['powerRating']}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color(0xFF005288),
                                            ),
                                          ),
                                        ],
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
