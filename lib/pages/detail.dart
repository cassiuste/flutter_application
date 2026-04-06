import 'package:flutter/material.dart';
import 'package:flutter_application/model/city.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key,
  required this.city});

  final City city;

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
          cityContent(city),
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

Widget cityContent(City city){
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
              ],
            ),
          );
}