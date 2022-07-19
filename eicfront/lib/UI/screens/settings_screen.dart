import 'package:eicfront/UI/screens/userboiler_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final storage = FlutterSecureStorage();
  String username = "";

  // void checkProfile() async {
  //   var response = await networkHandler.get("/profile/checkProfile");
  //   setState(() {
  //     username = response['username'];
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // checkProfile();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(24),
            children: [
              //account page, show account info stuffish
              SettingsGroup(
                title: '',
                children: [
                  buildUserProfile(),
                ],
              ),
              SettingsGroup(
                title: 'GENERAL',
                children: [
                  buildMyBoiler(),
                  buildConnectBoiler(),
                  buildDeviceOnline(),
                  buildLogout()
                ],
              ),
              SettingsGroup(
                title: 'FEEDBACK',
                children: [
                  buildReportBug(),
                  buildSendFeedback(),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildConnectBoiler() => SimpleSettingsTile(
        title: 'Configure Boiler',
        subtitle: '',
        leading: Icon(Icons.connect_without_contact),
        // onTap: connectBoiler,
      );
  Widget buildDeviceOnline() => SimpleSettingsTile(
        title: 'Connect Boiler to WiFi',
        subtitle: '',
        leading: Icon(Icons.wifi),
        // onTap: boilerOnline,
      );
  Widget buildReportBug() => SimpleSettingsTile(
        title: 'Report A Bug',
        subtitle: '',
        leading: Icon(Icons.bug_report),
      );
  Widget buildSendFeedback() => SimpleSettingsTile(
        title: 'Send Feedback',
        subtitle: '',
        leading: Icon(Icons.thumbs_up_down),
      );
  Widget buildMyBoiler() => SimpleSettingsTile(
        title: 'My Boiler',
        subtitle: '',
        leading: Icon(Icons.device_hub),
        onTap: myBoiler,
      );
  Widget buildLogout() => SimpleSettingsTile(
        title: 'Logout',
        subtitle: '',
        leading: Icon(Icons.logout),
        // onTap: logout,
      );
  Widget buildUserProfile() {
    return Column(
      children: <Widget>[
        //profilePhoto,
        Text(
          username,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  void myBoiler() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UserDevicesScreen()));
  }

  // void connectBoiler() {
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (context) => ConfigureDeviceScreen()));
  // }

  // void boilerOnline() {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => DeviceOnlineScreen()));
  // }

  // void logout() async {
  //   await storage.delete(key: "token");
  //   Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (context) => SignInPage()),
  //       (route) => false);
  // }
}
