// import 'package:eicfront/UI/queries/queries.dart';
// import 'package:eicfront/common/graphqlConfig.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// class LoginController {
//   final storage = new FlutterSecureStorage();
//   static String? emailValidator(String input) {
//     if (input.isEmpty) {
//       return 'must have Email';
//     }
//     if (!input.contains('@')) {
//       return "Email muct contain @";
//     }
//     return null;
//   }

//   static String? passwordValidator(String input) {
//     if (input.isEmpty) {
//       return 'must have password';
//     }
//     if (input.length < 6) {
//       return 'Minimum 6 characters';
//     }
//     return null;
//   }

//   Future<String> authUser(String email, String password, bool isLogin) async {
//     GraphQLConfig graphQLConfig = new GraphQLConfig();
//     GraphQLClient _client = graphQLConfig.clientToQuery();
//     QueriesMutations queryMutation = QueriesMutations();
//     print(email);
//     print(password);
//     if (1 == 1) {
//       QueryResult result = await _client.mutate(MutationOptions(
//           document: gql(
//         queryMutation.loginMutation(email, password),
//       )));
//       if (result.hasException) {
//         print(result);
//         return 'broken';
//       } else {
//         String token = result.data!['login']['accessToken'];
//         //GraphQLConfig.setToken(token);
//         await storage.write(key: "token", value: token);
//         print('login' + token);
//         return "success";
//       }
//     }
//     // else {
//     //   QueriesMutations queryMutation = QueriesMutations();
//     //   print(email);
//     //   print(password);
//     //   QueryResult result = await _client.mutate(MutationOptions(
//     //       document: gql(
//     //     queryMutation.registerMutation(email, password),
//     //   )));
//     //   if (result.hasException) {
//     //     print(result.exception);
//     //     return 'Nie udało się zarejestorwać';
//     //   } else {
//     //     String token = result.data['register']['accessToken'];
//     //     GraphQLConfiguration.setToken(token);
//     //     print('register' + token);

//     //     return null;
//     //   }
//     // }
//     return "";
//   }
// }
