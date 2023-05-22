import 'package:flutter/material.dart';
import 'package:random_password_generator/random_password_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isWithLetters = true;
  bool _isWithUppercase = false;
  bool _isWithNumbers = false;
  bool _isWithSpecial = false;
  double _numberCharPassword = 8;
  String newPassword = '';
  Color _color = Colors.blue;
  String isOk = '';
  TextEditingController _passwordLength = TextEditingController();
  final password = RandomPasswordGenerator();
  @override
  void initState() {
    super.initState();
  }

  checkBox(String name, Function onTap, bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(name),
        Checkbox(value: value, onChanged: onTap),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Генератор рандомных паролей'),
        ),
        body: Center(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                checkBox('Заглавные буквы', (bool value) {
                  _isWithUppercase = value;
                  setState(() {});
                }, _isWithUppercase),
                checkBox('Прописные буквы', (bool value) {
                  _isWithLetters = value;
                  setState(() {});
                }, _isWithLetters)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                checkBox('Специальные символы', (bool value) {
                  _isWithSpecial = value;
                  setState(() {});
                }, _isWithSpecial),
                checkBox('Цифры', (bool value) {
                  _isWithNumbers = value;
                  setState(() {});
                }, _isWithNumbers)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _passwordLength,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  filled: true,
                  fillColor: Colors.grey[300],
                  labelText: 'Введите колличество символов',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  if (_passwordLength.text.trim().isNotEmpty)
                    _numberCharPassword =
                        double.parse(_passwordLength.text.trim());

                  newPassword = password.randomPassword(
                      letters: _isWithLetters,
                      numbers: _isWithNumbers,
                      passwordLength: _numberCharPassword,
                      specialChar: _isWithSpecial,
                      uppercase: _isWithUppercase);

                  print(newPassword);
                  double passwordstrength =
                      password.checkPassword(password: newPassword);
                  if (passwordstrength < 0.3) {
                    _color = Colors.red;
                    isOk = 'Этот пароль очень слабый!';
                  } else if (passwordstrength < 0.7) {
                    _color = Colors.yellow;
                    isOk = 'Это хороший пароль!';
                  } else {
                    _color = Colors.green;
                    isOk = 'Это очень надежный пароль!';
                  }

                  setState(() {});
                },
                child: Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Сгенерировать пароль',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            if (newPassword.isNotEmpty && newPassword != null)
              Center(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    isOk,
                    style: TextStyle(color: _color, fontSize: 25),
                  ),
                ),
              )),
            if (newPassword.isNotEmpty && newPassword != null)
              Center(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    newPassword,
                    style: TextStyle(color: _color, fontSize: 25),
                  ),
                ),
              ))
          ],
        )),
      ),
    );
  }
}
