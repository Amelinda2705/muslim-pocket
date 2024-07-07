import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rive/rive.dart';

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
  late RiveAnimationController _riveController;
  bool _isPlaying = false;

  void playAnimation() => setState(() {
        _riveController.isActive = !_riveController.isActive;
      });

  void resetAnimation() {
    setState(() {
      _riveController.isActive = true;
      (_riveController as SimpleAnimation).reset();

      _riveController.apply(
          (_riveController as SimpleAnimation).instance!.animation.context, 0);
      _riveController.isActive = true;
    });
  }

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
    _riveController = OneShotAnimation(
      'sort',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  Widget _editTitleTextField() {
    if (_isEditingText) {
      return Center(
        child: SizedBox(
          width: 50,
          child: TextField(
            onChanged: (newValue) {
              setPreference();
              setState(() {
                if (newValue.isEmpty) {
                  _errorMessage = 'isi goals-mu';
                } else {
                  _errorMessage = null;
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
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          _isPlaying ? null : _riveController.isActive = true;
          // playAnimation();
          setState(() {
            // _riveController.isActive;
            setPreference();
            counter++;
            if (counter > int.parse(goals)) {
              counter = 1;
            } else if (int.tryParse(goals) == null) {
              goals = '1';
            }
          });
          // _togglePlay;
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
              SizedBox(
                height: 200,
                child: Center(
                  child: RiveAnimation.asset(
                    'assets/images/tasbih.riv',
                    fit: BoxFit.cover,
                    controllers: [_riveController],
                  ),
                ),
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
              ),
              // FloatingActionButton(
              //   onPressed: _togglePlay,
              //   tooltip: isPlaying ? 'Pause' : 'Play',
              //   child: Icon(
              //     isPlaying ? Icons.pause : Icons.play_arrow,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
