import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_expenses_tracker/features/auth/services/auth-http.service.dart';


import '../features/auth/models/user.model.dart';

class Responsive extends StatefulWidget {
  const Responsive({super.key});

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  final AuthHttpService authHttpService = AuthHttpService();

  late Future<List<User>> user;

  @override
  void initState() {
    super.initState();

    // user = authHttpService.findOne("917a8f5a-7748-476a-b3c7-dee58a2d68eb");
    user = authHttpService.findAll();

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
    // return FutureBuilder<dynamic>(
    //   future: user,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       return Column( children: [
    //           // Text(snapshot.data!.id),
    //           // Text(snapshot.data!.username)
    //         ],);
    //     } else if (snapshot.hasError) {
    //       return Text('${snapshot.error}');
    //     }
    //
    //     // By default, show a loading spinner.
    //     return const CircularProgressIndicator();
    //   },
    // );
    return FutureBuilder<List<User>>(
      future: user,
      builder: (context, snapshot) {
        // List<Widget> texts = [];
        List<Text> texts = [];

        if (snapshot.hasData) {
          for(User user in snapshot.data!){
            texts.add(Text(user.id ?? ""));
            texts.add(Text(user.username));
          }

          return Column( children: texts,);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }


}

