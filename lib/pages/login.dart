import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dartssh2/dartssh2.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Donnée entrée par les utilisateur
  TextEditingController theName = TextEditingController();
  TextEditingController pcNameorIP = TextEditingController();
  TextEditingController thePort = TextEditingController();
  TextEditingController thePassword = TextEditingController();
  String message = "";
  //test si donée OK ou pas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "connexion",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                  fontFamily: "handwritting"),
            ),
            TextField(
              controller: theName,
              decoration: InputDecoration(
                labelText: "Nom d'utilisateur",
                icon: Icon(Icons.person),
              ),
            ),
            TextField(
              controller: pcNameorIP,
              decoration: InputDecoration(
                  labelText: "IP ou Nom de l'ordinateur",
                  icon: Icon(Icons.mobile_friendly_rounded)),
            ),
            TextField(
              controller: thePort,
              decoration: InputDecoration(
                  labelText: "Port default:22",
                  icon: Icon(Icons.transit_enterexit)),
            ),
            TextField(
              controller: thePassword,
              decoration: InputDecoration(
                  labelText: "Mot de Passe",
                  icon: Icon(Icons.password_rounded)),
            ),
            MaterialButton(
              onPressed: test,
              color: Colors.blue,
              child: Text(
                "Se connecter",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

//Test ssh connection
  test() async {
    try {
      final client = SSHClient(
        await SSHSocket.connect(pcNameorIP.text, 22),
        username: theName.text,
        onPasswordRequest: () => thePassword.text,
      );
      try {
        await client.authenticated;
        final uptime = await client.run('uptime -s', stderr: false);
        //message = utf8.decode(uptime);
        Navigator.pushNamed(context, '/success');
      } on Exception catch (e) {
        setState(() {
          message = "Nom d'utilisateur ou mot de passe incorrect";
        });
      }
    } on Exception catch (e) {
      setState(() {
        message = "Reseau inaccesible: verifier votre connexion";
      });
    }
  }
}
