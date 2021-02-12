import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  static String ipaddress;

  void newAddress(String ndata) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ip', ndata);

    setState(() {
      ipaddress = (prefs.getString('ip'));
    });
  }

  _getAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      ipaddress = (prefs.getString('ip'));
    });
  }

  @override
  Widget build(BuildContext context) {
    _getAddress();
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        //overide default back arrow to return data
        leading: BackButton(
          onPressed: () => Navigator.pop(context, ipaddress),
        ),
      ),
      body: Column(children: [
        Text(
          'IP Address of Bot',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        TextField(
          textAlign: TextAlign.center,
          onChanged: (String data) {
            newAddress(data);
          },
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'Current Bot IP: $ipaddress',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
        Text(
          'PORT: 5005',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}
