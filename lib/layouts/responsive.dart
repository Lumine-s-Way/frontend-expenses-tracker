import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_expenses_tracker/features/auth/services/auth-http.service.dart';

import 'package:http/http.dart' as http;

import '../features/auth/models/user.model.dart';

class Responsive extends StatefulWidget {
  const Responsive({super.key});

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  final AuthHttpService authHttpService = AuthHttpService();

  late Future<Album> futureAlbum;
  late Future<User> user;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    user = authHttpService.findOne("917a8f5a-7748-476a-b3c7-dee58a2d68eb");
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    //return Scaffold(
    // backgroundColor: currentWidth < 600 ? Colors.blue : Colors.amber,
    // body: Center(child: Text(currentWidth.toString())),
    //);

    // return FutureBuilder<Album>(
    //   future: futureAlbum,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       return Text(snapshot.data!.title);
    //     } else if (snapshot.hasError) {
    //       return Text('${snapshot.error}');
    //     }
    //
    //     // By default, show a loading spinner.
    //     return const CircularProgressIndicator();
    //   },
    // );
    return FutureBuilder<User>(
      future: user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.id);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
