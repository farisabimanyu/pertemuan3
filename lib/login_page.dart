import 'package:flutter/material.dart';
import 'package:pertemuan3/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var namauser;


  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  _showInput(namacontroller, placeholder, isPassword) {
    return TextField(
      controller: namacontroller,
      obscureText: isPassword,decoration: InputDecoration(
      hintText: placeholder,
      ));
  }
    
    _showDialog(pesan, alamat) {
      return showDialog(
        context: context,
  builder: (context) {
    return AlertDialog(
      title: Text(pesan),
      actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => alamat,
                ),
                );
          },
          )
      ],
      );
  }    );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ), // AppBar
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showInput(_usernameController, 'Masukkan Username', false),
            _showInput(_passwordController, 'Masukkan Password', true),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                if (_usernameController.text == 'Abimanyu' &&
                    _passwordController.text == 'H1D021072') {
                  // save Username
                  _saveUsername();
                  // Show alert
                  _showDialog('Anda Berhasil Login', const HomePage());
                } else {
                  // Show alert
                  _showDialog('Username dan Password Salah', const LoginPage());
                }
              }, // onPressed
            ), // ElevatedButton
          ], // children
        ), // Column
      ), // Container
    ); // Scaffold
  }
}
