// import 'package:newfront/Pages/WelcomePage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:newfront/NetworkHandler.dart';
// import 'package:newfront/Screen/ProvisionScreen.dart';
// import 'package:provider/provider.dart';
// import 'package:newfront/State/AppState.dart';

// class NewHomePage extends StatefulWidget {
//   NewHomePage({Key? key}) : super(key: key);

//   @override
//   _NewHomePageState createState() => _NewHomePageState();
// }

// class _NewHomePageState extends State<NewHomePage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
//   int pageIndex = 0;

//   @override
//   void initState() {
//     WidgetsBinding.instance?.addPostFrameCallback((_) {
//       var state = Provider.of<AppState>(context, listen: false);
//       state.setpageIndex = 0;
//     });

//     super.initState();
//   }

//   Widget _body() {
//     return SafeArea(
//       child: Container(
//         child: _getPage(Provider.of<AppState>(context).pageIndex),
//       ),
//     );
//   }

//   Widget _getPage(int index) {
//     switch (index) {
//       case 0:
//         return BoilerPage(scaffoldKey: _scaffoldKey);
//       case 1:
//         return HeatPumpPage(scaffoldKey: _scaffoldKey);
//       case 1:
//         return MakeUpAirPage(scaffoldKey: _scaffoldKey);
//       case 1:
//         return ForcedAirPage(scaffoldKey: _scaffoldKey);
//       default:
//         return BoilerPage(scaffoldKey: _scaffoldKey);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       bottomNavigationBar: const BottomMenuBar(),
//       drawer: const SidebarMenu(),
//       body: _body(),
//     );
//   }
// }
