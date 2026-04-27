import 'package:flutter/material.dart';
import 'package:flutter_application/model/cities.dart';
import 'package:flutter_application/model/city.dart';
import 'package:flutter_application/routing/routes.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key,
  required this.city,
  required this.username});
  
  final City city;
  final String username;

 @override
 Widget build(BuildContext context) {
 return Scaffold(
  appBar: AppBar(
  title: Text(city.name, style: TextStyle(color: Colors.white))
        ,backgroundColor: Colors.lightBlue),
  
  body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Hero(
              tag: city.name,
              child: cityImage(city),
            ),
          ),
          cityContent(city, context, username),
        ],
      ),
    );
 }
}

Widget cityImage(City city) {
  return Image.network(
    city.imageUrl,
    width: double.infinity,
    height: 250,
    fit: BoxFit.cover,
  );
}

Widget cityContent(City city, BuildContext context, String username){
  return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city.name,
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${city.country} • Population: ${city.population}",
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Text(
                  city.description,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                deleteCityButton(city, context, username)
              ],
            ),
          );
}


Widget deleteCityButton(City city, BuildContext context, String username){
  return TextButton(
    onPressed: () => 
    showDialog(context: context, 
    builder: (BuildContext context) => AlertDialog(
      title: Text("Delete city"),
      content: Text("Are you sure you want to delete this city?"),
      actions: [
        cancelButton(context),
        confirmDeleteButton(city, context, username)
      ],
    )),
    child: Text("Delete City"));
}

Widget cancelButton(BuildContext context){
  return TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel"));
}

Widget confirmDeleteButton(City city, BuildContext context, String username){
  return TextButton(onPressed: () {
  cities.remove(city);
  Navigator.pushReplacementNamed(context, Routes.list, arguments: username);
  },
  child: Text("Delete"));
}