import 'package:flutter/material.dart';
import 'package:flutter_application/model/cities.dart';
import 'package:flutter_application/model/city.dart';
import 'package:flutter_application/routing/routes.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key,
  required this.username});
  
  final String username;
  

 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
  title: const Text("List Page", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue),
  body:
  Column(
  children: [
    Padding(padding: const EdgeInsets.all(16)
    , child: Text("Bienvenido, $username", style: const TextStyle(fontSize: 20)),),
    Expanded(
      child: list(cities, context, username),
    ),
  ],
),
 );
}
}

Widget list(List<City> cities, BuildContext context, String username) {
  return ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          final city = cities[index];
          return listElement(city, context, username);
        },
      );
}

  Widget listElement(City city, BuildContext context, String username) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.detail, arguments: {
            "city": city,
            "username": username
          });
        },
        child: 
        Column(
      children: [
      Row(
      children: [
        Hero(
          tag: city.name,
          child: 
          Image.network(city.imageUrl, width: 125, height: 125, fit: BoxFit.cover),
        ),
        
        const SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(city.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(city.country, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              Text(city.population.toString(), style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
        ),
      ],
        ),
        const Divider(
            color: Colors.grey
          ),
      ],
    )
      ),
    );
      }