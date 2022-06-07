// import 'dart:io';

// import 'package:newfront/Screen/BoilerScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:newfront/NetworkHandler.dart';
// import 'package:newfront/Model/DevicedataModel.dart';

// class BoilerWidget extends StatelessWidget {
//   const BoilerWidget(
//       {Key? key, required this.deviceDataModel, required this.networkHandler})
//       : super(key: key);

//   final DevicedataModel deviceDataModel;
//   final NetworkHandler networkHandler;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 280,
//       padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
//       width: MediaQuery.of(context).size.width,
//       child: Card(
//         child: Stack(
//           children: <Widget>[
//             Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(),
//             ),
//             Positioned(
//               bottom: 2,
//               child: Container(
//                 padding: EdgeInsets.all(7),
//                 height: 60,
//                 width: MediaQuery.of(context).size.width - 30,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8)),
//                 child: Text(
//                   deviceDataModel.temperature.toString(),
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
