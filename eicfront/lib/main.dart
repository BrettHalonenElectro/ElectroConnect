import 'package:eicfront/UI/pages/home_page.dart';
import 'package:eicfront/UI/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'UI/pages/loginqlpage.dart';
import 'common/graphqlConfig.dart';
import 'common/graphql_config.dart';
//import 'ui/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  // //runApp(MyApp());

  runApp(const ProviderScope(child: MyApp()));
  //runApp(MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  // GraphQLConfig graphQLConfig = new GraphQLConfig();
  // @override
  // Widget build(BuildContext context) {
  //   // ValueNotifier<GraphQLClient> client = GraphQLConfig.graphInit();
  //   return GraphQLProvider(
  //     client: client,
  //     child: MaterialApp(
  //       title: 'Electro Connect',
  //       theme: ThemeData(
  //         primarySwatch: Colors.green,
  //       ),
  //       home: LoginQLPage(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context, ref) {
    final client = ref.watch(gqlClientProvider);
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Instagram Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (_) => LoginPage(),
          '/init': (_) => HomePage(),
        },
      ),
    );
  }
}
