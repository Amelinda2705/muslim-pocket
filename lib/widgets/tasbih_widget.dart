import 'package:flutter/material.dart';
import 'package:muslimpocket/commons/global.dart';

class TasbihSection extends StatelessWidget {
  const TasbihSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0/',
                  style:
                      TextStyle(fontSize: 36, fontWeight: Global().semiBold)),
              Text('33',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: Global().semiBold,
                      decoration: TextDecoration.underline))
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
    );
  }
}