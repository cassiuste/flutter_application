import 'package:flutter/material.dart';

class CountPage extends StatefulWidget {
  const CountPage({super.key,
  required this.username});

  final String username;

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Count Page", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue, 
      ),
      body: Center(
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [

          textUsername(),
          
          const SizedBox(height: 20),

          imageUser(),

          const SizedBox(height: 40),

          Text("$_counter",
          style: TextStyle(fontSize: 50)),
  
          const SizedBox(height: 20),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              decrementButton(),
              const SizedBox(width: 30),
              incrementButton()
            ],
            )
        ],
      ),
      ),
    );
  }


  Widget textUsername(){
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 2),
      ),
      child: Text(
        "Welcome ${widget.username}!",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget imageUser(){
    return Image.network(
      "https://cdn-icons-png.freepik.com/512/6681/6681213.png",
      height: 150,
    );
  }

  Widget incrementButton(){
    return ElevatedButton(
        onPressed: _incrementCounter,
        style: ElevatedButton.styleFrom(
        minimumSize: const Size(60, 60)),
        child: Icon(Icons.add,
                    size: 30,),
    );
  }

  Widget decrementButton(){
    return ElevatedButton(
        onPressed: _decrementCounter,
        style: ElevatedButton.styleFrom(
        minimumSize: const Size(60, 60)),
        child: Icon(Icons.remove,
                    size: 30,),
    );
  }
}
