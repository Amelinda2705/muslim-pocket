import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasbihSection extends StatefulWidget {
  const TasbihSection({super.key});

  @override
  State<TasbihSection> createState() => _TasbihSectionState();
}

class _TasbihSectionState extends State<TasbihSection> {
  int counter = 0;
  bool _isEditingText = false;
  late TextEditingController _editingController;
  String goals = "33";
  String? _errorMessage;

  Future<void> setPreference() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final tasbihData = json.encode({
      'counter': counter.toString(),
      'goals': goals,
    });

    await preferences.setString('tasbihData', tasbihData);
  }

  Future<void> getPreference() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final String? tasbihData = preferences.getString('tasbihData');

    if (tasbihData != null) {
      final Map<String, dynamic> data = json.decode(tasbihData);
      setState(() {
        counter = int.parse(data['counter'] as String);
        goals = data['goals'] as String;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: goals);
    getPreference();
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  Widget _editTitleTextField() {
    if (_isEditingText) {
      return Center(
        child: Container(
          width: 50,
          child: TextField(
            onChanged: (newValue) {
              setPreference();
              setState(() {
                if (newValue.isEmpty) {
                  setState(() {
                    _errorMessage = 'isi goals-mu';
                  });
                } else {
                  setState(() {
                    _errorMessage = null;
                  });
                }
                goals = newValue;
                if (int.parse(goals) != 1) {
                  counter = counter;
                } else {
                  counter = 1;
                }
              });
            },
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: InputBorder.none,
              errorText: _errorMessage,
            ),
            style: TextStyle(
              fontSize: 36,
              fontWeight: Global().semiBold,
              decoration: TextDecoration.underline,
            ),
            controller: _editingController,
            keyboardType: TextInputType.number,
            autofocus: true,
          ),
        ),
      );
    }
    _editingController.text = goals;

    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Text(
        goals,
        style: TextStyle(
          fontSize: 36,
          fontWeight: Global().semiBold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPreference(),
      builder: (context, _) => InkWell(
        onTap: () {
          setState(() {
            setPreference();
            counter++;
            if (counter > int.parse(goals)) {
              counter = 1;
            } else if (int.tryParse(goals) == null) {
              goals = '1';
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$counter/',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: Global().semiBold,
                    ),
                  ),
                  _editTitleTextField(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                child: Image.asset('assets/images/tasbih.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Center(
                  child: Text(
                    'Klik di mana saja\nuntuk mulai',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: Global().light,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
