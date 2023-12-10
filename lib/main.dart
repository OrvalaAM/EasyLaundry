import 'package:flutter/material.dart';
import 'package:mvp/components/card_pewangi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CardPewangi> listPewangi = [
    const CardPewangi(nama: 'Fresh Ocean', foto: 'assets/fresh-ocean.jpg'),
    const CardPewangi(nama: 'Candy', foto: 'assets/candy.jpg'),
    const CardPewangi(nama: 'Coffee Cream', foto: 'assets/coffee.jpg'),
    const CardPewangi(nama: 'Sakura', foto: 'assets/sakura.jpg'),
    const CardPewangi(nama: 'Strawberry', foto: 'assets/stroberi.jpg'),
    const CardPewangi(nama: 'Jasmine', foto: 'assets/jasmine.png'),
  ];

  String pilihan = "";
  void setPilihanPewangi($index) {
    setState(() {
      pilihan = listPewangi[$index].nama;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          GridView.count(
            crossAxisCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(listPewangi.length, (index) {
              return GestureDetector(
                onTap: () => setPilihanPewangi(index),
                child: listPewangi[index],
              );
            }),
          ),
          if (pilihan != "")
            Container(
              color: Colors.red,
              child: Center(child: Text(pilihan)),
            )
        ],
      ),
    );
  }
}
