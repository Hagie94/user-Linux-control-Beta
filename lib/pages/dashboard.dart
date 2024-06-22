import 'package:flutter/material.dart';
import 'package:dartssh2/dartssh2.dart';
import 'login.dart';

class IfNotSucceed extends StatefulWidget {
  const IfNotSucceed({super.key});
  @override
  State<IfNotSucceed> createState() => _IfNotSucceedState();
}
class _IfNotSucceedState extends State<IfNotSucceed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.white,
            child: const Center(
              child: Text(""),
            ),
          ),
          Container(
            height: 20,
            color: Colors.lightBlueAccent,
            child: const Center(
              child: Text("Utilisateur existant:"),
          ),
          ),
          Container(
            height: 150,
            color: Colors.lightBlueAccent,
            child: const Center(child:
            Text('John Doe')),
          ),
          Container(
            height: 20,
            color: Colors.lightGreenAccent,
            child: const Center(child:
            Text('Ajouter un nouveau utilisateur:'),
            ),
          ),
          Container(
            height: 50,
            color: Colors.lightGreenAccent,
            child: const Center(child: TextField()),
          ),
          Container(
            height: 50,
            color: Colors.lightGreenAccent,
            child: const Center(child:
                Text("Not ok"),
            )),
          Container(
            height: 20,
            color: Colors.redAccent,
            child: const Center(child:
            Text('Supprimer utilisateur existant:'),
            ),
          ),
          Container(
            height: 50,
            color: Colors.redAccent,
            child: const Center(child: TextField()),
          ),
          Container(
              height: 50,
              color: Colors.redAccent,
              child: const Center(child:
              Text("Supprimer"),
              )),
        ],
      )
    );
  }

  void ajouter(){

  }
}