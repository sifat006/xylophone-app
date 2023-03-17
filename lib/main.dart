import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  playSound(int soundNumber) {
    return () async {
      final player = AudioPlayer();
      await player.play(
        AssetSource('note$soundNumber.wav'),
      );
    };
  }

  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(color)),
        onPressed: playSound(soundNumber),
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child:  Text('Xylophone')),
          backgroundColor: Colors.red,
         ),
        body: SafeArea(
          child: Column(
           
            children: [
              buildKey(color: Colors.amber, soundNumber: 1),
              buildKey(color: Colors.cyan, soundNumber: 2),
              buildKey(color: Colors.teal, soundNumber: 3),
              buildKey(color: Colors.purple, soundNumber: 4),
              buildKey(color: Colors.orange, soundNumber: 5),
              buildKey(color: Colors.black, soundNumber: 6),
              buildKey(color: Colors.deepPurple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
