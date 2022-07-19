// import 'package:eicfront/UI/pages/home_page.dart';
// import 'package:eicfront/view_model/loginController.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart';

// const users = {
//   'jimmy@gmail.com': 'password',
// };

// class LoginQLPage extends StatelessWidget {
//   Duration get loginTime => const Duration(milliseconds: 2250);
//   Future<String> _logAuthUser(LoginData data) {
//     print('Name: ${data.name}, Password: ${data.password}');
//     LoginController ctrl = LoginController();
//     return ctrl.authUser(data.name, data.password, true);
//   }

//   // Future<String> _regAuthUser(LoginData data) {
//   //   LogRegController ctrl = new LogRegController();
//   //   return ctrl.authUser(data.name, data.password, false);
//   // }

//   Future<String> _recoverPassword(String name) {
//     print('Name: $name');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(name)) {
//         return 'Podana nazwa użytkownika nie istnieje';
//       }
//       return "null recover pass";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FlutterLogin(
//       title: 'Planner',
//       onLogin: _logAuthUser,
//       onSignup: _logAuthUser,
//       //onRecoverPassword: ,
//       onSubmitAnimationCompleted: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => HomePage(),
//           ),
//         );
//       },
//       // emailValidator: LoginController.emailValidator,
//       // passwordValidator: LoginController.passwordValidator,
//       showDebugButtons: false,
//       onRecoverPassword: _recoverPassword,
//       messages: LoginMessages(
//         //usernameHint: 'Email',
//         passwordHint: 'Hasło',
//         confirmPasswordHint: 'Wpisz ponownie hasło',
//         loginButton: 'ZALOGUJ SIĘ',
//         signupButton: 'REJESTRACJA',
//         goBackButton: 'Powrót',
//         forgotPasswordButton: 'Zapomniałeś hasła?',
//         confirmPasswordError: 'Hasła do siebie nie pasują',
//         recoverPasswordDescription:
//             'Aby otrzymać ponownie hasło musisz podać mail użyty podczas rejestracji',
//         recoverPasswordSuccess: 'Email z potwierdzeniem został wysłany',
//       ),
//     );
//   }
// }
