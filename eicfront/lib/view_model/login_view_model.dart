import 'package:flutter/cupertino.dart';
import 'package:eicfront/providers/state.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String TOKEN_STORAGE = 'INSTA-TOKEN';
AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

class LoginViewModel {
  Future<bool> checkToken(BuildContext context, WidgetRef ref) async {
    const secure = FlutterSecureStorage();
    final token = await secure.read(key: TOKEN_STORAGE);
    if (token != null && token.isNotEmpty) {
      ref.read(bearerToken.state).state = token;
      // debugPrint(token);
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/nav-page', (route) => false);
      return true;
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
      return false;
    }
  }

  Future<String?> getToken() async {
    const secure = FlutterSecureStorage();
    final token = await secure.read(key: TOKEN_STORAGE);
    return token;
  }

  // Future<String> getUserId() async {
  //   const secure = FlutterSecureStorage();
  //   final token = await secure.read(key: TOKEN_STORAGE);
  // }

  // Future<QueryResult> getUserId() async {
  //   String getId = ''' ''';
  // }

  String getUserId = '''
  query getUserId {
  currentUserId
}
''';
  var currentUser = new Map<String, dynamic>();

  // getCurrentUser() async {
  //   // GraphQLConfiguration graphQLConfig = new GraphQLConfiguration();
  //   // GraphQLClient _client = graphQLConfig.clientToQuery();
  //   const secure = FlutterSecureStorage();
  //   final token = await secure.read(key: TOKEN_STORAGE);

  //   QueryResult result =
  //   return currentUser;
  // }

  Future<void> setToken(
      BuildContext context, WidgetRef ref, String token) async {
    print("hiiiiiii");
    const secure = FlutterSecureStorage();
    await secure.write(key: TOKEN_STORAGE, value: token);
    ref.read(bearerToken.state).state = token;
    Navigator.of(context).pushNamedAndRemoveUntil('/init', (route) => false);
  }
}
