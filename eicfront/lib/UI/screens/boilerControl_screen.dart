import 'package:flutter/material.dart';

class BoilerControlScreen extends StatefulWidget {
  const BoilerControlScreen({
    Key? key,
  }) : super(key: key);
  // final String temp;

  @override
  _BoilerControlScreenState createState() => _BoilerControlScreenState();
}

class _BoilerControlScreenState extends State<BoilerControlScreen> {
  int _zoneOneTemp = 60;
  int _zoneTwoTemp = 60;
  int _zoneThreeTemp = 60;
  int _zoneFourTemp = 60;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff7cae41),
            title: const Text("Boiler Configuration"),
            bottom: TabBar(
              tabs: [
                Text("Zone Setup"),
                Text("Temp Setup"),
                Text("Pump Setup")
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: const [
                      Text("Zone 1:"),
                    ],
                  ),
                  Slider(
                    thumbColor: Color(0xff0C4861),
                    activeColor: Color(0xff0C4861),
                    inactiveColor: Colors.lightBlue.shade300,
                    value: _zoneOneTemp.toDouble(),
                    min: 50.0,
                    max: 120.0,
                    //divisions: 10,
                    label: '$_zoneOneTemp',
                    onChanged: (double newValue) {
                      setState(() {
                        _zoneOneTemp = newValue.round();
                      });
                    },
                    onChangeEnd: (double newValue) {
                      // print('Ended change on $newValue');
                    },
                  ),
                  Column(
                    children: [
                      Text(_zoneOneTemp.toString()),
                    ],
                  ),
                  Column(
                    children: const [
                      Padding(padding: EdgeInsets.all(20)),
                      Text("Zone 2:"),
                    ],
                  ),
                  Slider(
                    thumbColor: Color(0xff0C4861),
                    activeColor: Color(0xff0C4861),
                    inactiveColor: Colors.lightBlue.shade300,
                    value: _zoneTwoTemp.toDouble(),
                    min: 50.0,
                    max: 120.0,
                    //divisions: 10,
                    label: '$_zoneTwoTemp',
                    onChanged: (double newValue) {
                      setState(() {
                        _zoneTwoTemp = newValue.round();
                      });
                    },
                    onChangeEnd: (double newValue) {
                      // print('Ended change on $newValue');
                    },
                  ),
                  Column(
                    children: [
                      Text(_zoneTwoTemp.toString()),
                    ],
                  ),
                  Column(
                    children: const [
                      Padding(padding: EdgeInsets.all(20)),
                      Text("Zone 3:"),
                    ],
                  ),
                  Slider(
                    thumbColor: Color(0xff0C4861),
                    activeColor: Color(0xff0C4861),
                    inactiveColor: Colors.lightBlue.shade300,
                    value: _zoneThreeTemp.toDouble(),
                    min: 50.0,
                    max: 120.0,
                    //divisions: 10,
                    label: '$_zoneThreeTemp',
                    onChanged: (double newValue) {
                      setState(() {
                        _zoneThreeTemp = newValue.round();
                      });
                    },
                    onChangeEnd: (double newValue) {
                      // print('Ended change on $newValue');
                    },
                  ),
                  Column(
                    children: [
                      Text(_zoneThreeTemp.toString()),
                    ],
                  ),
                  Column(
                    children: const [
                      Padding(padding: EdgeInsets.all(20)),
                      Text("Zone 4:"),
                    ],
                  ),
                  Slider(
                    thumbColor: Color(0xff0C4861),
                    activeColor: Color(0xff0C4861),
                    inactiveColor: Colors.lightBlue.shade300,
                    value: _zoneFourTemp.toDouble(),
                    min: 50.0,
                    max: 120.0,
                    //divisions: 10,
                    label: '$_zoneFourTemp',
                    onChanged: (double newValue) {
                      setState(() {
                        _zoneFourTemp = newValue.round();
                      });
                    },
                    onChangeEnd: (double newValue) {
                      // print('Ended change on $newValue');
                    },
                  ),
                  Column(
                    children: [
                      Text(_zoneFourTemp.toString()),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.directions_transit),
            const Icon(Icons.directions_bike),
          ]),
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
