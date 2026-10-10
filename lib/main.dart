import 'package:app_ddm_delivery/page/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false));
}

class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Entregar em', style: TextStyle(fontSize: 12)),
            Text('Endereço do Usuário'),
          ],
        ),
        actions: [
          Text("Alterar"),
          Padding(padding: EdgeInsets.all(8)),
          Icon(Icons.shopping_cart_sharp, size: 28),
          Padding(padding: EdgeInsets.all(8)),
        ],
      ),
      body: Home(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.greenAccent,
        backgroundColor: Colors.amberAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
