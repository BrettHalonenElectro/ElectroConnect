// import 'dart:io';

// import "package:flutter/material.dart";
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import "package:graphql_flutter/graphql_flutter.dart";

// class GraphQLConfig {
//   final storage = new FlutterSecureStorage();
//   // final token = await storage.read(key: "token");

//   // static Link link = null;
//   static HttpLink httpLink = HttpLink(
//     "http://localhost:3000/graphql",
//   );

//   ///static get uuidFromObject => null;

//   // static void setToken(String token) {
//   //   AuthLink alink = AuthLink(getToken: () async => 'Bearer ' + token);
//   //   GraphQLConfig.link = alink.concat(GraphQLConfig.httpLink);
//   // }

//   // static void removeToken() {
//   //   GraphQLConfig.link = null;
//   // }

//   Future getToken() async {
//     return await storage.read(key: "token");
//   }

//   static ValueNotifier<GraphQLClient> graphInit() {
//     // String token = await storage.read(key: "token");
//     // final AuthLink authLink = AuthLink(
//     //   // getToken: () async => 'Bearer ${await storage.read(key: "token")}',
//     // );

//     // final Link link = authLink.concat(httpLink);

//     ValueNotifier<GraphQLClient> client = ValueNotifier(
//       GraphQLClient(
//         link: link,
//         // The default store is the InMemoryStore, which does NOT persist to disk
//         cache: GraphQLCache(
//           store: HiveStore(),
//         ),
//       ),
//     );

//     return client;
//   }

//   GraphQLClient clientToQuery() {
//     AuthLink authLink = AuthLink(
//       getToken: () async => 'Bearer ${await storage.read(key: "token")}',
//     );

//     final Link link = authLink.concat(httpLink);
//     return GraphQLClient(
//       cache: GraphQLCache(
//         store: HiveStore(),
//       ),
//       link: link,
//     );
//   }
// }


//   // static Link getLink() {
//   //   if (GraphQLConfig.link != null) {
//   //     return GraphQLConfig.link;
//   //   } else {
//   //     return GraphQLConfig.httpLink;
//   //   }
//   //   // return GraphQLConfig.link != null
//   //   //     ? GraphQLConfig.link
//   //   //     : GraphQLConfig.httpLink;
//   // }

//   // ValueNotifier<GraphQLClient> client = ValueNotifier(
//   //   GraphQLClient(
//   //     link: getLink(),
//   //     cache: GraphQLCache(),
//   //   ),
//   // );

//   // GraphQLClient clientToQuery() {
//   //   return GraphQLClient(
//   //     cache: GraphQLCache(),
//   //     link: getLink(),
//   //   );
//   // }

//   // final GraphQLCache cache = GraphQLCache(
//   //   dataIdFromObject: uuidFromObject,
//   // );
// // }
