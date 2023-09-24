import 'package:flutter/material.dart';
import 'package:pertemuan3/about_page.dart';
import 'package:pertemuan3/home_page.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:ListView(
        children: [
          const DrawerHeader(
            child: Text('Sidemenu'),
          ),
            ListTile(
             leading: const Icon(Icons.home),
             title: const Text('Home'),
             onTap: () {
              //Navigasi ke halaman Home
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                   ),
              );
             },
             ),
            ListTile(
             leading: const Icon(Icons.info),
             title: const Text('About'),
             onTap: () {
              //Navigasi ke halaman Setting
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                   ),
              );
             },
             ),
        ], 
      ),
    );
    }
  }
