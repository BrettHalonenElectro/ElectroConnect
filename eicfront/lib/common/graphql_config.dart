import 'package:flutter/cupertino.dart';
import 'package:eicfront/providers/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final StateProvider<String> authTokenProvider =
    StateProvider<String>((_) => '', name: 'tokenP');

final gqlClientProvider = Provider<ValueNotifier<GraphQLClient>>((ref) {
  final String? token = ref.watch(bearerToken.state).state;
  print("this is the token: $token");
  // print("does the thingy hit this${token!}");
  final HttpLink _httpLink = HttpLink('http://localhost:3000/graphql',
      defaultHeaders: {
        if (token!.isNotEmpty) 'Authorization': 'Bearer $token'
      });

  if (token.isNotEmpty) {
    print("maade it to auth link");
    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $token',
    );
    final Link link = authLink.concat(_httpLink);
  }

  final _webSocketLink = WebSocketLink('ws://10.0.2.2:4200/graphql');
  var _link = Link.split(
      (request) => request.isSubscription, _webSocketLink, _httpLink);

  print("link: $_link");

  return ValueNotifier(
    GraphQLClient(
      link: _link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
});
