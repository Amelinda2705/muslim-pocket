import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
// import 'package:flutter_gif/flutter_gif.dart';

class TasbihAnimation extends StatefulWidget {
  const TasbihAnimation({super.key});

  @override
  State<TasbihAnimation> createState() => _TasbihAnimationState();
}

class _TasbihAnimationState extends State<TasbihAnimation>
    with TickerProviderStateMixin {
  late final GifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Gif(
      image: const AssetImage("assets/images/tasbih.gif"),
      controller:
          _controller, // if duration and fps is null, original gif fps will be used.
      // fps: 30,
      // duration: const Duration(seconds: 1),
      autostart: Autostart.no,
      placeholder: (context) => const Text('Loading...'),
      onFetchCompleted: () {
        _controller.reset();
        _controller.forward();
      },
    );
  }
}
