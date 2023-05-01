import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Dice Game'),
        backgroundColor: Color.fromARGB(255, 244, 54, 54),
      ),
      body: DiceGame(),
    ),
  ));
}

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int leftdice = 1;
  int rightdice = 2;
  AudioCache audioCache = AudioCache();
 

 void initState() {
  super.initState();
  audioCache.load('assets/dice_roll.mp3');
}


  void playSound() async {
    audioCache.play('dice_roll.mp3');
  }

  rolldices() {
    playSound();
    setState(() {
      leftdice = Random().nextInt(6) + 1;
      rightdice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Image.asset('assets/diceLogo.png'),
        ),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Image.asset('assets/dice$leftdice.png'),
              ),
            ),
            SizedBox(width: 16.0), 
              Expanded(
                child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Image.asset('assets/dice$rightdice.png'),
              ),
            ),
          ],
        )),
        ElevatedButton(
          onPressed: () {
          rolldices();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 243, 33, 33)),
          ),
          child: Text(
           'Roll It!',
           style: GoogleFonts.lobster(fontSize: 20),
          ),
        ),
        SizedBox(height: 50.0),
      ],
    );
  }
}